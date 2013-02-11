class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :code
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :zoom
      t.integer :space

      t.timestamps
    end
  end
end
