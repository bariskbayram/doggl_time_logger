class AddTypeIdToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :type_id, :integer
  end
end
