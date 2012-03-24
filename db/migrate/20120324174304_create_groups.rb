class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :groups, :user_id
  end
end
