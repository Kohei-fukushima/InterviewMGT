class Interview < ApplicationRecord
  belongs_to :user
  has_many :interiew_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy
end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end