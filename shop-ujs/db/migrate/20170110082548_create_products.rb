class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :user, index: true
      t.string :name
      t.decimal :price
      t.text :description

      t.timestamps

    end
    add_index :products, [:user_id, :created_at]
  end
end
