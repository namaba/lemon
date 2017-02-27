class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :sex
      t.integer :play_style
      t.date :birthday
      t.text :address
      t.integer :plan
      t.text :introduce
      t.string :image1
      t.string :image2
      t.string :image3
      t.integer :height
      t.string :style
      t.string :job
      t.string :income
      t.string :hobby
      t.string :housemate
      t.integer :alcohol
      t.integer :smoke
      t.integer :purpose
      t.integer :marriage
      t.integer :child
      t.integer :identification,    default: 1
      t.string :identification_image
      t.integer :good_count,        default: 20
      t.integer :coins_count,       default: 20
      t.integer :mail_status,       default: 1

      t.timestamps null: false
    end
  end
end
