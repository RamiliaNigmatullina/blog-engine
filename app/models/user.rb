class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
  validates :full_name, presence: true

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :blogs, through: :subscriptions
  has_one :blog
  has_many :posts
end
