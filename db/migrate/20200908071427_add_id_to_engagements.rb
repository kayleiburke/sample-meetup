class AddIdToEngagements < ActiveRecord::Migration[5.2]
  def change
    # add an id column to the engagements table so that we can allow for CRUD
    add_column :engagements, :id, :primary_key
  end
end
