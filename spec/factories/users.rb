FactoryGirl.define do
  # Each time when a new answer is created in :question_with_answers
  # (factories/questions.rb), a new user will be created in :answer
  # (factories/answers.rb). Because an email can be registered only once
  # (model validation), we need to create always different emails.
  sequence(:email) { |i| "user_#{i}@mail.com" }

  factory :user do
    email
    name "User"
    password "foobar"
  end
end
