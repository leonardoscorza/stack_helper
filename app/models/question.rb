class Question < ApplicationRecord
	belongs_to :user
	validates :user_id, :title, :text, :tag_body, presence: true
	has_and_belongs_to_many :hashtags
	has_many :answers, dependent: :destroy

	after_create do
		question_tags = self.tag_body.scan(/#\w+/)
		question_tags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
			self.hashtags << tag
		end
	end

	before_update do
		self.hashtags.clear # delete all and add again
		question_tags = self.tag_body.scan(/#\w+/)
		question_tags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
			self.hashtags << tag
		end
	end
end
