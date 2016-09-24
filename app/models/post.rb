class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :blog
  belongs_to :user

  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :tags
end
