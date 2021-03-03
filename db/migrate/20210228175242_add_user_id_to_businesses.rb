class AddUserIdToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :user_id, :integer
    add_index :businesses, :user_id
  end
end
