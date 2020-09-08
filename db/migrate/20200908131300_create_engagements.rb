class CreateEngagements < ActiveRecord::Migration[5.2]
  def change
    create_table :engagements do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :role
    end

    add_index :engagements, [:user_id, :group_id, :role], unique: true
  end
end
