class Create < ActiveRecord::Migration
  def up
    create_table :attendees_meetings, :id => false do |t|
      t.references :attendee
      t.references :meeting
    end

    add_index :attendees_meetings, [:attendee_id, :meeting_id]
    add_index :attendees_meetings, [:meeting_id, :attendee_id]
  end

  def down
    drop_table :attendees_meetings
  end
end
