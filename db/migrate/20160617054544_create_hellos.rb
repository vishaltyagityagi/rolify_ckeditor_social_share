class CreateHellos < ActiveRecord::Migration
  def change
    create_table :hellos do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
