class Blog < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true

  belongs_to :user

  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :posts

  has_one :category
end
