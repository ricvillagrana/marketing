class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description, null: true
      t.string :contact_name, null: true
      t.string :phone, null: true
      t.string :email, null: true
      t.string :address, null: true
      t.time :init_hour, null: true
      t.time :final_hour, null: true

      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
