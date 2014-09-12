class AddUserIdToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :user_id, :integer
    add_index :requirements, [:user_id, :created_at]  
end
end
