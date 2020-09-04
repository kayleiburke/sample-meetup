class UserGroupRole < ApplicationRecord
  self.table_name = "users_groups_roles"
  belongs_to :user
  belongs_to :group
  belongs_to :role
end
