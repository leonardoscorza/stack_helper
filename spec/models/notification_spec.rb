require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '#associations' do
	  it 'belongs to a user' do
	  	assc = Notification.reflect_on_association(:user)
		  expect(assc.macro).to eq(:belongs_to)
	  end
	end
end
