FactoryGirl.define do
  factory :question do
    title "This is the question title"
    text "This is the question text"
    tag_body "#ruby #rails #javascript"
    user

    trait :invalid do
      title nil
    end

    factory :question_with_answers do
      # Create a local variable with the number of answers to create
      transient do
        answers_count 5
      end

      # Through evaluator we access the transient counter, and say that
      # we would like to create answers (create_list 1st argument) that
      # belongs to the question created above (create_list 3th argument).
      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end
    end
  end
end
