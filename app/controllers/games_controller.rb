class GamesController < ApplicationController
  @data = nil
  @level = 0
  @cells_arr = []
  
  def index
    set_data
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
	
	save_table
  end
  
  def reset_table
    reset
	
	render :index
  end
  
  def touch(x=nil, y=nil, color=nil)
    set_data if @data == nil
	
	@level = 0
	@cells_arr = []
	x = params[:x]
	y = params[:y]
	color = params[:color]
	
    check_cell(x.to_i, y.to_i, color)
	puts @data
	move_all
	
	render :index
  end
  
  def check_cell(x,y,color)    
    if @data[x][y] == color
	  @level = @level+1
	  
	  tmp = x.to_s << y.to_s
	  return 0 if @cells_arr.include? tmp
      @cells_arr << tmp
      check_cell(x+1, y, color) if x<7
	  check_cell(x, y+1, color) if y<7
	  check_cell(x-1, y, color) if x>0
	  check_cell(x, y-1, color) if y>0
	  if @level > 3
		@data[x][y] = nil
	  end	  
	end
	
	return 0
  end
  
  def move_all()
    7.downto(0) do |i|
	  tmp = []
	  (0..7).each do |j|
	    if @data[i][j].nil? and i>0
	      @data[i][j] = @data[i-1][j]
		  @data[i-1][j] = nil
        end		  
	  end
	end
	
	save_table
  end
 
  def set_data
    sid = request.session_options[:id]
    current_game = Game.find_by_session_id sid
    if current_game.nil?	
      reset
	  game = Game.new({:session_id => sid, :data => @data.to_json, :status_id => Status.first.id})
	  game.save
	else
	  @data = JSON.parse current_game.data
	end
  end
  
  def save_table
    sid = request.session_options[:id]
    current_game = Game.find_by_session_id sid
    unless current_game.nil?
	  current_game.update_attribute(:data, @data.to_json)
	  current_game.save!
	end
  end
end
