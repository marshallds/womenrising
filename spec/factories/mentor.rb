FactoryGirl.define do
  factory :mentor do
    mentoring factory: :user
    mentee factory: :user
    question { Faker::Lorem.sentence + '?' }
  end
end
