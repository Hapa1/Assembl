class Classpage < ApplicationRecord
	has_many :users 
	has_many :posts
	validates :name, presence: true


  def feed
    post.where("user_id = ?", id)
  end

    
 
end


