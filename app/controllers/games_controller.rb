class GamesController < ApplicationController
  @data = nil
  
  def index
    sid = request.session_options[:id]
    current_game = Game.find_by_session_id sid
    if current_game.nil?	
      reset
	  #game = Game.new({:session_id => sid, :data => @data.to_json, :status_id => Status.first.id})
	  #game.save
	else
	  @data = current_game.data
	end
  end
  
  def reset
    colors = %w[red blue green yellow orange]
    r = Random.new
	@data = Array.new
    	
	(0..7).each do |i|
	  tmp = []
	  (0..7).each do |j|
	    c_index = r.rand(0...5)
	    tmp << colors[c_index]
	  end
	  @data.push tmp
	end
  end
  
  def touch
    
  end
end
