class Role < ApplicationRecord
  has_many :user_group_roles
end
