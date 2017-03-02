class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :target_id,        null: false
      t.integer :status,           default: 1

      t.timestamps null: false
    end
  end
end
