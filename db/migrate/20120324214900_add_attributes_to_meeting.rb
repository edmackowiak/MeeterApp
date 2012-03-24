class AddAttributesToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :title, :string
    add_column :meetings, :date, :date
    add_column :meetings, :start_time, :time
    add_column :meetings, :end_time, :time
    add_column :meetings, :location, :string
    add_column :meetings, :agenda, :string
  end
end
