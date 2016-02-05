class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
  validates :title, presence: true,length: { maximum: 150 }
  validates :content, presence: true,length: { minimum: 50 }
  mount_uploader :imagess, ImageUploader
end
