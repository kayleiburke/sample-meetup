class Group < ApplicationRecord
  has_many :users
  has_many :user_group_roles
  has_many :roles, through: :user_group_roles
end
