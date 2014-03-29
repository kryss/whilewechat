class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :event_date
      t.integer :slot
      t.float :price

      t.timestamps
    end
  end
end
