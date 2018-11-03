class CreateCompaniesUsersRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :companies_users_roles do |t|
      t.references :role, foreign_key: true
      t.references :companies_users, foreign_key: true
    end
  end
end
