class AddStatusesTable < ActiveRecord::Migration
  def up
    create_table "statuses" do |t|
      t.column "name", :string
      t.column "description", :string
    end
  end

  def down
    drop_table "statuses"
  end
end
