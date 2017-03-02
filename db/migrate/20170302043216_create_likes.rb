class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :target_id,           null: false
      t.integer :like,                default: 0
      t.integer :is_liked,            default: 0
      t.integer :status,              default: 0

      t.timestamps null: false
    end
  end
end
