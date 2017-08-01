class CreateTopicSmiles < ActiveRecord::Migration
  def change
    create_table :topic_smiles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at
    end
  end
end
