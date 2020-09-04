class CreateJoinTableUsersGroupsRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_groups_roles, id: false, primary_key: [:user_id, :group_id, :role] do |t|
      t.references :user
      t.references :group
      t.references :role
    end

    add_index(:users_groups_roles, [:user_id, :group_id])
    add_index(:users_groups_roles, [:user_id, :role_id])
    add_index(:users_groups_roles, [:group_id, :role_id])
  end
end
