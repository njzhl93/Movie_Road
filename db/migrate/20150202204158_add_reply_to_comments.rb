class AddReplyToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :in_reply_to, :integer
    add_index :comments, [:user_id, :in_reply_to]
  end
end
