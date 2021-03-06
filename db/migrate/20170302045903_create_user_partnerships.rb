class CreateUserPartnerships < ActiveRecord::Migration
  def change
    create_table :user_partnerships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :partnership, index: true, foreign_key: true
      t.integer :status,            default: 1

      t.timestamps null: false
    end
  end
end
