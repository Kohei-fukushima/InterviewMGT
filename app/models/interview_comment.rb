class InterviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :interview

  validates :comment, presence: true
end
