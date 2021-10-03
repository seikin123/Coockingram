class Recipe < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :likes, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
