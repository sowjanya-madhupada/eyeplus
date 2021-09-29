class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :glasses_type
      t.string :gender
      t.string :frame_type
      t.string :brand
      t.float :price
      t.string :color

      t.timestamps
    end
  end
end
