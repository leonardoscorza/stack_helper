class Answer < ApplicationRecord
	acts_as_votable
	belongs_to :user
	belongs_to :question
	validates  :user_id, :text, presence: true
end
