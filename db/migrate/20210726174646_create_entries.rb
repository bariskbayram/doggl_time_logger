class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :description
      t.integer :log_type_id
      t.timestamp :start_time
      t.timestamp :stop_time

      t.timestamps
    end
  end
end
