class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  acts_as_voter
  has_many :notifications
  has_many :answers
  has_many :questions
  has_attached_file :avatar, styles: { small: "40x40>" }, :default_url => "/assets/:style/avatar_default_:style.png"
  validates_attachment_content_type :avatar, :content_type => %w(image/jpg image/jpeg image/png)#{}/\Aimage\/.*\z/
  validates :name, presence: true, length: { maximum: 50 }



  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.name = auth.info.name
       user.password = Devise.friendly_token[0,20]
       user.image = auth.info.image
     end
  end
end
