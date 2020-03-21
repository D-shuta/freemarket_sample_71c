class RemoveRegionFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :region, :string
  end
end
