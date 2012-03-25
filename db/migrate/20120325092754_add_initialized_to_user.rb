class AddInitializedToUser < ActiveRecord::Migration
  def change
    add_column :users, :initialized, :boolean

  end
end
