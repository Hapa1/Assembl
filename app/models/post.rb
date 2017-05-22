class Post < ApplicationRecord
	belongs_to :classpage
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
    mount_uploader :picture, PictureUploader
	validates :title, presence: true
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :body, presence: true
	has_many :comments
	
end