class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :partnership_id, null:false
      t.integer :sender_id, null: false
      t.text :body
      t.string :image
      t.integer :read, default: 1 , null: false

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
