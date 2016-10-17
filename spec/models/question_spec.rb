require 'rails_helper'

RSpec.describe Question, type: :model do
  #subject { Question.new(user_id: 1, title: "Example", text: "Some text", tag_body: "#ruby #rails") }

  describe 'validates' do
		it 'be valid' do
			expect(create(:question)).to be_valid
		end

    describe 'raise record invalid' do
  		it 'when Title is blank' do
  			expect { create(:question, title: nil) }.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Title can't be blank")
  		end
      it "when Text is blank" do
        expect { create(:question, text: nil) }.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Text can't be blank")
      end
      it "when Tag Body is blank" do
        expect { create(:question, tag_body: nil) }.to raise_error(ActiveRecord::RecordInvalid,"Validation failed: Tag body can't be blank")
      end

    end

  end

  describe 'associations' do
	  it 'belongs to a user' do
	  	assc = Question.reflect_on_association(:user)
		  expect(assc.macro).to eq(:belongs_to)
	  end

	  it 'has and belongs to many hashtags' do
	  	assc = Question.reflect_on_association(:hashtags)
		  expect(assc.macro).to eq(:has_and_belongs_to_many)
	  end

    it 'has many answers' do
      assc = Question.reflect_on_association(:answers)
      expect(assc.macro).to eq(:has_many)
    end
	end
end
