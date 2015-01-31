class AddMemberToUser < ActiveRecord::Migration
  def change
    add_column :users, :member_type, :string
    add_column :users, :member_id, :integer
  end
end
