class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.numeric :total
      t.string :state

      t.timestamps
    end
  end
end
