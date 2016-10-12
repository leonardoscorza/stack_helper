FactoryGirl.define do
  factory :answer do
    user
    question
    text "This is the answer text"
  end
end
