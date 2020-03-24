class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string     :first_destinaition_name, null: false
      t.string     :destinaition_name, null: false
      t.string     :first_destinaition_kana, null: false
      t.string     :destinaition_kana, null: false
      t.integer    :postal_code, null: false
      t.string     :prefectures, null: false
      t.string     :municipality, null: false
      t.string     :address, null: false
      t.string     :building_name
      t.integer    :phone_number
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
