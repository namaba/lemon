class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user, index: true, foreign_key: true
      t.string :user_name
      t.integer :target_id
      t.string :target_name
      t.text :body

      t.timestamps null: false
    end
  end
end
