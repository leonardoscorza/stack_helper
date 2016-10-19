require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { Answer.new(question_id: 1, user_id: 1, text: "Some text") }

  describe '#validations' do
		it 'is valid with valid attributes' do
			expect(subject).to be_valid
		end

		it 'is not valid without an text' do
			subject.text = nil
			expect(subject).to_not be_valid
		end
	end

  describe '#associations' do
	  it 'belongs to a user' do
	  	assc = described_class.reflect_on_association(:user)
		  expect(assc.macro).to eq(:belongs_to)
	  end

	  it 'belongs to a question' do
	  	assc = described_class.reflect_on_association(:question)
		  expect(assc.macro).to eq(:belongs_to)
	  end
	end
end
