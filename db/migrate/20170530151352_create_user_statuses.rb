class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :good_count, default: 0, null: false
      t.integer :free_coin, default: 0, null: false
      t.integer :pay_coin, default: 0, null: false

      t.timestamps null: false
    end
  end
end
