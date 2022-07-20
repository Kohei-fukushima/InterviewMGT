class Interview < ApplicationRecord
  belongs_to :user, optional: true
  has_many :interview_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :schedule, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end

