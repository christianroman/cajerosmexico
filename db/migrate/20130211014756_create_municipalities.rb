class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :name
      t.integer :state_id
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
