require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  subject { described_class.new(name: "rails") }

  describe 'Validations' do
		it 'is valid with valid attributes' do		
			expect(subject).to be_valid
		end

		it 'is not valid without an name' do
			subject.name = nil
			expect(subject).to_not be_valid
		end
	end

  describe 'Associations' do
	  it 'has and belongs to many' do
	  	assc = described_class.reflect_on_association(:questions)
		  expect(assc.macro).to eq(:has_and_belongs_to_many)
	  end
	end
end
