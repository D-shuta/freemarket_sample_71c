class AddSelarIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :selar_id, :integer
  end
end
