class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :title

      t.timestamps
    end
  end
end
