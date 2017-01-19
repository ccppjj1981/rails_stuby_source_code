class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :state
      t.string :city
      t.string :address
      t.string :address2
      t.string :zipcode
      t.string :receiver
      t.string :phone

      t.timestamps
    end
  end
end
