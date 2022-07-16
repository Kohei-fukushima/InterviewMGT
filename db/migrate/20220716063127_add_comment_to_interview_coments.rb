class AddCommentToInterviewComents < ActiveRecord::Migration[6.1]
  def change
    add_column :interview_comments, :comment, :text
  end
end
