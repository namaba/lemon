class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.references :user, index: true, foreign_key: true
      t.string :category
      t.text :introduce
      t.string :image
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
