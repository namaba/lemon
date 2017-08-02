class CreateMurmurs < ActiveRecord::Migration
  def change
    create_table :murmurs do |t|
      t.references :user, index: true, foreign_key: true
      t.text :body,    limit: 200
      t.string :image
      t.boolean :comment_badge, default: false
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
