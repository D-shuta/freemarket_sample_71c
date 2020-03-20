class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.string     :content, null: false
      t.string     :state, null: false
      t.integer    :postage, null: false
      t.integer    :shipping_date, null: false
      t.integer    :price, null: false
      t.string     :region, null: false
      t.timestamps
    end
  end
end
