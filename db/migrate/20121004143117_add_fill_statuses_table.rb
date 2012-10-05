class AddFillStatusesTable < ActiveRecord::Migration
  def up
	execute <<-endsql
      INSERT INTO statuses (`name`, `description`) VALUES
        ('created', 'initial state'),
		('started', 'started game'),
		('finished', 'finished game')
    endsql
  end

  def down
  end
end
