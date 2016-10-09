class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter       
  has_many :notifications
  has_many :answers
  has_many :questions
  validates :name, presence: true, length: { maximum: 50 }
end
