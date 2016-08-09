class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
end
