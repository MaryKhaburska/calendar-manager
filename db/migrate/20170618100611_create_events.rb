class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :uuid
      t.string :name
      t.text :description
      t.datetime :duration
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :wholeday
      t.integer :repeat
      t.integer :calendar_id

      t.timestamps
    end
  end
end
