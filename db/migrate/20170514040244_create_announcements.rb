class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.references :user, index: true, foreign_key: true
      t.references :user_profile, index: true, foreign_key: true
      t.text :body
      t.integer :status,  default: 1

      t.timestamps null: false
    end
  end
end
