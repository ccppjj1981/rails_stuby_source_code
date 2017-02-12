class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :images,array: true, default: []

      t.timestamps
    end
  end
end
