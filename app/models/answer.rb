class Answer < ApplicationRecord
	acts_as_votable
	belongs_to :user
	belongs_to :question
	validates  :question_id, :user_id, :text, presence: true
end
