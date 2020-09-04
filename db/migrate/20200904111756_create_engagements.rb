class CreateEngagements < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :groups, table_name: "engagements" do |t|
      t.index [:user_id, :group_id]
      t.index [:group_id, :user_id]
      t.integer :role
    end
  end
end
