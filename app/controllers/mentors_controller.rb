class MentorsController < ApplicationController
  before_filter :require_auth

  def new
    @user = current_user
    @mentor = Mentor.new()
  end

  def create
    @user = current_user
    @mentor = Mentor.new(mentee: current_user, question: params[:mentor][:question])
    if @mentor.save
      @mentor.send_mail

      SlackNotification.notify(:new_mentor, "User id #{@user.id} is a new mentor")

      redirect_to user_path(current_user)
    else
      render :new
    end
  end
end
