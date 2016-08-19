class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy

  belongs_to :blog
  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
