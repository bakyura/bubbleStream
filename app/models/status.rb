class Status < ActiveRecord::Base
  attr_accessible :id, :name, :description

  has_one :game
end
