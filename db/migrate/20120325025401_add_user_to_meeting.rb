class AddUserToMeeting < ActiveRecord::Migration
  def change
    change_table :meetings do |t|
      t.references :user
    end
  end
end
