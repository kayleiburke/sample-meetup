class User < ApplicationRecord
  has_many :user_group_roles
  has_many :groups, through: :user_group_roles
end
