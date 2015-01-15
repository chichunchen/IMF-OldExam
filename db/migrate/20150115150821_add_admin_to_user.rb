class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :public, :boolean, :default => false
  end
end
