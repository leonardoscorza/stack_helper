class Question < ApplicationRecord
	belongs_to :user
	validates :title, :text, presence: true
	has_and_belongs_to_many :hashtags

	after_create do
		question_tags = self.tag_body.scan(/#\w+/)
		question_tags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
			self.hashtags << tag
		end
	end

	before_update do
		question.hashtags.clear # delete all and add again
		question_tags = self.text.scan(/#\w+/)
		question_tags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
			question.hashtags << tag
		end
	end
end
