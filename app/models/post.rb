class Post < ActiveRecord::Base
  mount_uploader :postimage, PostImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
end
