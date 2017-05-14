# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 5.times do |no|
#   User.create(name: "テスト#{no + 5}", encrypted_password: "$2a$11$1xnUyZgDIeoP2nBLiu/jru8cblPZ01.M07I4nzJOAyVSRZJcLju1O", email: "test#{no + 5}@gmail.com")
#   UserProfile.create(:name => "タイトル #{no + 5}")
# end

User.create(name: "テスト6", email: "test6@gmail.com")
