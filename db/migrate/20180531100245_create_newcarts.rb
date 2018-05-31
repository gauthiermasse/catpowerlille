class CreateNewcarts < ActiveRecord::Migration[5.2]
  def change
    create_table :newcarts do |t|
      t.string :session_id

      t.timestamps
    end
  end
end
