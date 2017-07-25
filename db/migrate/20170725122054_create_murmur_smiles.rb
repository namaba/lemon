class CreateMurmurSmiles < ActiveRecord::Migration
  def change
    create_table :murmur_smiles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :murmur, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
