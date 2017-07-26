class AddCardToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :card_uuid, :string, null: false, default: '', unique: true
  end
end
