require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { described_class.new(title: "Examle", text: "Some text", tag_body: "#ruby #rails") }

  describe 'Validations' do
		it 'is valid with valid attributes' do		
			expect(subject).to be_valid
		end

		it 'is not valid without an title' do
			subject.title = nil
			expect(subject).to_not be_valid
		end

		it 'is not valid without an text' do
			subject.text = nil
			expect(subject).to_not be_valid
		end

		it 'is not valid without an tag' do
			subject.tag_body = nil
			expect(subject).to_not be_valid
		end
	end

  describe 'Associations' do
	  it 'belongs to a user' do
	  	assc = described_class.reflect_on_association(:user)
		  expect(assc.macro).to eq(:belongs_to)
	  end

	  it 'has and belongs to many' do
	  	assc = described_class.reflect_on_association(:hashtags)
		  expect(assc.macro).to eq(:has_and_belongs_to_many)
	  end
	end
end
