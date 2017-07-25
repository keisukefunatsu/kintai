class CreateAttendDates < ActiveRecord::Migration[5.1]
  def change
    create_table :attend_dates do |t|
      t.references :user_id, foreign_key: true
      t.datetime :in
      t.datetime :out

      t.timestamps
    end
  end
end
