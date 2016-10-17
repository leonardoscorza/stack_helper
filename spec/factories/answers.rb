FactoryGirl.define do
  factory :answer do
    text "This is the answer text"
    question
    user
  end
end
