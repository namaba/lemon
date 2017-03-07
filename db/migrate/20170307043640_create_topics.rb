class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :community, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title,               null: false
      t.text :body
      t.integer :status,             default: 1

      t.timestamps null: false
    end
  end
end
