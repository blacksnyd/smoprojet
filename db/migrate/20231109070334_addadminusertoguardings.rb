class Addadminusertoguardings < ActiveRecord::Migration[7.0]
  def change
    add_reference :guardings, :admin_user, null: true, foreign_key: true
  end
end
