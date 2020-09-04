# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(first_name: "Kaylei", last_name: "Burke")
user_2 = User.create!(first_name: "Test", last_name: "User")

omaha_js = Group.create!(name: "Omaha JS")
coding_club = Group.create!(name: "Coding Club")
ruby_on_ales = Group.create!(name: "Ruby on Ales")

organizer = Role.create!(name: "Organizer")
participant = Role.create!(name: "Participant")
presenter = Role.create!(name: "Presenter")

UserGroupRole.create!(user: user_1, group: omaha_js, role: organizer)
UserGroupRole.create!(user: user_1, group: omaha_js, role: participant)
UserGroupRole.create!(user: user_1, group: coding_club, role: participant)
UserGroupRole.create!(user: user_1, group: ruby_on_ales, role: participant)
UserGroupRole.create!(user: user_2, group: omaha_js, role: participant)
UserGroupRole.create!(user: user_2, group: coding_club, role: participant)
