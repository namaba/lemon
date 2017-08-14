class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :sex, default: 0
      t.integer :play_style
      t.date :birthday, default: 19000101
      t.integer :address, default: 13
      t.integer :plan
      t.text :introduce
      t.string :image1
      t.string :image2
      t.string :image3
      t.integer :height
      t.integer :style
      t.integer :job
      t.integer :income
      t.string :hobby
      t.integer :housemate
      t.integer :alcohol
      t.integer :smoke
      t.integer :purpose
      t.integer :marriage
      t.integer :child
      t.string :personality
      t.string :charmpoint
      t.string :sociability
      t.integer :holiday
      t.integer :want_to_marriage
      t.string :condition
      t.integer :to_meet
      t.integer :blood_type
      t.integer :school
      t.integer :bro_sis
      t.integer :identification,    default: 1
      t.string :identification_image
      t.integer :good_count,        default: 20
      t.integer :coins_count,       default: 20
      t.integer :mail_status,       default: 1
      t.timestamps null: false
    end
  end
end
