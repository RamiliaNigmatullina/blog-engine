class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
  validates :full_name, presence: true

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :posts

  has_many :subscribed_blogs, class_name: "Blog", through: :subscriptions
  has_many :blogs
end
