class AddUserIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :integer
    add_index  :products, [:user_id, :created_at]
  end
end
