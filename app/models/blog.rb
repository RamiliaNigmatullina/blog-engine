class Blog < ActiveRecord::Base
  belongs_to :user

  has_many :subscriptions
  has_many :subscribers, class_name: "User", through: :subscriptions

  has_many :posts
end