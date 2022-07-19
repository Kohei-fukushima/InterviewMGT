class AddScheduleToInterviews < ActiveRecord::Migration[6.1]
  def change
    add_column :interviews, :schedule, :datetime
  end
end
