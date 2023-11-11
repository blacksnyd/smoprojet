class RemoveCurrentSignInAtToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :current_sign_in_at
  end
end
