class AddMonthlyFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :monthly_flag, :integer
  end
end
