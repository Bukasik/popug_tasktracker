class AddRoleToAccount < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE account_roles AS ENUM ('admin', 'manager', 'worker');
    SQL
    add_column :accounts, :role, :account_roles, null: false, default: 'worker'
  end

  def down
    remove_column :accounts, :role
    execute <<-SQL
      DROP TYPE account_roles;
    SQL
  end
end
