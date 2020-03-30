class RemoveStateFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :state, :string
  end
end
