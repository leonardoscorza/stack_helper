FactoryGirl.define do
  # Every time we create a new answer in :question_with_answers
  # (factories/questions.rb), a new user will be created in :answer
  # (factories/answers.rb). Because an email can be registered only once
  # (model validation), we need create a always different emails.
  sequence(:email) { |i| "user_#{i}@mail.com" }

  factory :user do
    email
    name "User"
    password "foobar"
  end
end
