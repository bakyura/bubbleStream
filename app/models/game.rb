class Game < ActiveRecord::Base
  attr_accessible :id, :session_id, :status_id, :data

  belongs_to :status
end
