class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :receive_id
      t.string :content

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :receive_id
  end
end
