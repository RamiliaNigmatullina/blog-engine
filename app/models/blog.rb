class Blog < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :user
  belongs_to :category

  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions, dependent: :destroy
end
