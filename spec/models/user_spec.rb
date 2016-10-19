require 'rails_helper'

RSpec.describe User, type: :model do
	subject { User.new(name: "Example", email: "foo@bar.com", password: "foobar") }

	describe '#validations' do
		it 'is valid with valid attributes' do
			expect(subject).to be_valid
		end

		it 'is not valid without a email' do
			subject.email = nil
			expect(subject).to_not be_valid
		end

		it 'is not valid without an password' do
			subject.password = nil
			expect(subject).to_not be_valid
		end

		it "is not valid with nil value" do
			subject.admin = nil
			expect(subject).to_not be_valid
		end
	end

	describe '#associations' do
	  it 'has many notifications' do
	  	assc = User.reflect_on_association(:notifications)
		  expect(assc.macro).to eq(:has_many)
	  end

	  it 'has many answers' do
	  	assc = User.reflect_on_association(:answers)
		  expect(assc.macro).to eq(:has_many)
	  end

	  it 'has many questions' do
	  	assc = User.reflect_on_association(:questions)
		  expect(assc.macro).to eq(:has_many)
	  end
	end
end
