class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start_date
      t.datetime :ends_date
      t.string :image
      t.string :description
      t.string :organizer_name
      t.string :event_type

      t.timestamps null: false
    end
  end
end
