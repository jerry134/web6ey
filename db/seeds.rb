# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
Role.create!([{ name: 'admin' }, { name: 'member' }])

user = User.find_or_create_by_email('example@6bey.com', :username => 'demo', :password => 'password')
user.roles << Role.find_by_name('admin')
user.save!
