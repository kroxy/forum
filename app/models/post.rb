class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
  validates :title, presence: true,length: { maximum: 150 }
  validates :content, presence: true,length: { minimum: 50 }
  has_attached_file :image, styles: { :medium => "300x300>", }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
