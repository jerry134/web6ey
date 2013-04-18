class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :user
      t.references :role
      t.timestamps
    end

    add_index :user_roles, ['user_id', 'role_id'] 
  end
end
