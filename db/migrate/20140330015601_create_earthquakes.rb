class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.string :place
      t.float :latitude
      t.float :longitude
      t.float :magnitude
      t.datetime :time

      t.timestamps
    end
  end
end
