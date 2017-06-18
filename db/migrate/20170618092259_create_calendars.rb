class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :name
      t.boolean :trackable
      t.integer :count
      t.string :ical_link
      t.integer :user_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
