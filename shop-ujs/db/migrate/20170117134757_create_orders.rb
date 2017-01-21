class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :number
      t.string :payment_state
      t.string :shipment_state

      t.timestamps
    end
  end
end
