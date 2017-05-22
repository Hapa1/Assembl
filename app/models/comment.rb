class Comment < ApplicationRecord
	belongs_to :post
	default_scope -> { order(created_at: :desc) }
	belongs_to :user
  validates :body, :presence => true
end
