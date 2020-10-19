class AddAddresAndPhoneFieldsToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :birth_date, :date
  end
end
