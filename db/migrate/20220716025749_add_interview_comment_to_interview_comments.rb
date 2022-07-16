class AddInterviewCommentToInterviewComments < ActiveRecord::Migration[6.1]
  def change
    add_column :interview_comments, :interview_comment, :text
  end
end
