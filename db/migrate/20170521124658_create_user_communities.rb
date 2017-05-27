class CreateUserCommunities < ActiveRecord::Migration
  def change
    create_table :user_communities do |t|
      t.references :user, index: true, foreign_key: true
      t.references :community, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
