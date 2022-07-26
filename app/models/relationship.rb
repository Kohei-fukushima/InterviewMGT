class Relationship < ApplicationRecord
  #フォローするユーザーに結びついている
  belongs_to :following, class_name: "User"
  #フォローされるユーザに結びついている
  belongs_to :follower, class_name: "User"
end
