class CreateInDates < ActiveRecord::Migration[5.1]
  def change
    create_table :in_dates do |t|
      t.references :user, foreign_key: true
      t.datetime :in
      t.datetime :out

      t.timestamps
    end
  end
end
