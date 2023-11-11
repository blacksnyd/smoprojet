class RemoveDeviseTrackableColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :sign_in_count, :integer, default: 0, null: false
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_ip, :string
    remove_column :users, :last_sign_in_ip, :string

    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
  end
end
