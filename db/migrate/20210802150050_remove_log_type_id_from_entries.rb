class RemoveLogTypeIdFromEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :log_type_id, :integer
  end
end
