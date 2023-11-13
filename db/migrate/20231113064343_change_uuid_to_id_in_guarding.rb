class ChangeUuidToIdInGuarding < ActiveRecord::Migration[7.0]
  def change
    remove_column :guardings, :id
    add_column :guardings, :id, :integer, default: 1, primary_key: true
  end
end
