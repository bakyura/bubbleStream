class FixDataColumnType < ActiveRecord::Migration
  def up
    change_column :games, :data, :text
  end

  def down
  end
end
