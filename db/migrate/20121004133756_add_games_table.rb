class AddGamesTable < ActiveRecord::Migration
  def up
    create_table "games" do |t|
      t.column "session_id", :string
      t.column "status_id", :integer
	  t.column "data", :string
    end
  end

  def down
    drop_table "games"
  end
end
