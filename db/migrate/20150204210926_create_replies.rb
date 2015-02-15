class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :comment, index: true
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
