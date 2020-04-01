class RemoveCardNameFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_name, :string
    remove_column :cards, :card_number, :integer
    remove_column :cards, :cvc, :integer
    remove_column :cards, :exp_month, :integer
    remove_column :cards, :exp_year, :integer
  end
end