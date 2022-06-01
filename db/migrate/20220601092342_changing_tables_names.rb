class ChangingTablesNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :total, :score
    rename_column :games, :frame, :frames
  end
end
