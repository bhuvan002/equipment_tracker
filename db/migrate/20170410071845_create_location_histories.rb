class CreateLocationHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :location_histories do |t|
      t.string :location
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
