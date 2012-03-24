class CreateAttendeesGroupsTable < ActiveRecord::Migration
  def up
    create_table :attendees_groups, :id => false do |t|
      t.references :attendee
      t.references :group
    end

    add_index :attendees_groups, [:attendee_id, :group_id]
    add_index :attendees_groups, [:group_id, :attendee_id]
  end

  def down
    drop_table :attendees_groups
  end
end
