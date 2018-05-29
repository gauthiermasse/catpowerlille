class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
    	t.belongs_to :user, index: { unique: true }, foreign_key: true
    	t.timestamps
    end
  end
end
