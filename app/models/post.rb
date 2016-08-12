class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  
  belongs_to :blog
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  mount_uploader :photo, PhotoUploader
end
