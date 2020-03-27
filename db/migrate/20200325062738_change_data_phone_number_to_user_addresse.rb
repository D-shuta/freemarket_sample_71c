class ChangeDataPhoneNumberToUserAddresse < ActiveRecord::Migration[5.2]
  def change
  change_column :user_addresses, :phone_number, :bigint
  end
end
