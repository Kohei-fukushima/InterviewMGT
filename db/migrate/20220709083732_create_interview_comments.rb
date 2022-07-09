class CreateInterviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :interview_comments do |t|
      t.integer :user_id
      t.integer :interview_id
      t.timestamps
    end
  end
end
