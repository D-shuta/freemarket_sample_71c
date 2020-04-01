class AddItemIdToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :item_id, :integer
  end
end
