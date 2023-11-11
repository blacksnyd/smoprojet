class ChangeIdToUuidInGuarding < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' # Only for PostgreSQL

    remove_column :guardings, :id
    add_column :guardings, :id, :uuid, default: 'gen_random_uuid()', primary_key: true

    # If the table references other tables, you may need to change the column type to uuid as well.
    # add_column :other_table_name, :model_name_id, :uuid
  end
end
