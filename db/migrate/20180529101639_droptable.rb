class Droptable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :items_users
  end
end
