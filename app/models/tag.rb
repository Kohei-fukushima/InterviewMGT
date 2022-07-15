class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :interviews, through: :post_tags
end
