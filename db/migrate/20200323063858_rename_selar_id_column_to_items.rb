class RenameSelarIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :selar_id, :seller_id
  end
end
