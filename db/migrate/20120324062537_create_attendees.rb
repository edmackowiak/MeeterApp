class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.integer :hourly_rate
      t.string :email
      t.belongs_to :user
      t.references :meeting

      t.timestamps
    end
    add_index :attendees, :user_id
  end
end
