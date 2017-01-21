class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.references :product, index: true
      t.decimal :price
      t.string :size
      t.timestamps null: false
    end
  end
end
