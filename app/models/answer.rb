class Answer < ApplicationRecord
	acts_as_votable
	belongs_to :user
	belongs_to :question
	validates  :text, presence: true
end
