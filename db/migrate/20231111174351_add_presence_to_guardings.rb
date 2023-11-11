class AddPresenceToGuardings < ActiveRecord::Migration[7.0]
  def change
    add_column :guardings, :presence, :boolean
  end
end
