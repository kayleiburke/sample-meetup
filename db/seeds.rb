# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.find_or_create_by(first_name: "Kaylei", last_name: "Burke")
user_2 = User.find_or_create_by(first_name: "Test", last_name: "User")

omaha_js = Group.find_or_create_by(name: "Omaha JS")
coding_club = Group.find_or_create_by(name: "Coding Club")
ruby_on_ales = Group.find_or_create_by(name: "Ruby on Ales")

Engagement.find_or_create_by(user: user_1, group: omaha_js, role: :organizer)
Engagement.find_or_create_by(user: user_1, group: coding_club, role: :participant)
Engagement.find_or_create_by(user: user_1, group: ruby_on_ales, role: :participant)
Engagement.find_or_create_by(user: user_2, group: omaha_js, role: :organizer)
Engagement.find_or_create_by(user: user_2, group: coding_club, role: :presenter)
