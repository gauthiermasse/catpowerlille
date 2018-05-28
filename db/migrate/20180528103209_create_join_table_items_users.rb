class CreateJoinTableItemsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :users do |t|
       t.index [:item_id, :user_id]
       t.index [:user_id, :item_id]
    end
  end
end
