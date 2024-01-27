class CreateWildcatPriorityAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :wildcat_priority_areas do |t|
      t.string :location
      t.string :status
      t.decimal :shape_length
      t.decimal :shape_area
      t.geometry :wkb_geometry, srid: 4326

      t.timestamps
    end
    add_index :wildcat_priority_areas, :wkb_geometry, using: :gist
  end
end
