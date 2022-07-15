class PostTag < ApplicationRecord
  belongs_to :interview
  belongs_to :tag
end
