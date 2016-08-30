class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes

  belongs_to :blog
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :tags
end
