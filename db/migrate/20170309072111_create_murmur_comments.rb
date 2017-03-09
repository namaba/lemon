class CreateMurmurComments < ActiveRecord::Migration
  def change
    create_table :murmur_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :murmur, index: true, foreign_key: true
      t.string :comment
      t.integer :status,  default: 1

      t.timestamps null: false
    end
  end
end
