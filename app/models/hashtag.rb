class Hashtag < ApplicationRecord
	validates :name, presence: true
	has_and_belongs_to_many :questions
end
