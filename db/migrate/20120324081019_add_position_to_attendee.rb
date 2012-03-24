class AddPositionToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :position, :string

  end
end
