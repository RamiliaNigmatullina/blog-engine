class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  has_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
  belongs_to :blog
  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
