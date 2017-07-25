class AddPresenceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :present, :string, null: false, default: 3
  end
end
