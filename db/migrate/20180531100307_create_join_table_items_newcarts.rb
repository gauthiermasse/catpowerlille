class CreateJoinTableItemsNewcarts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :newcarts do |t|
       t.index [:item_id, :newcart_id]
       t.index [:newcart_id, :item_id]
    end
  end
end
