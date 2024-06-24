class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post

  has_many :likes, dependent: :destroy, foreign_key: "user_id"
  has_many :liked_posts, through: :likes, source: :post

  has_many :followers, class_name: "Follower", foreign_key: "follower_id"
  has_many :follower_users, through: :followers, source: :user

  has_many :followeds, class_name: "Followed", foreign_key: "followed_id"
  has_many :followed_users, through: :followeds, source: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
end
