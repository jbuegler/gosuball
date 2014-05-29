require 'gosu'

class MainWindow < Gosu::Window
	def initialize
		@x = 1
		@y = 1
		@xdir = 2
		@ydir = 3
		super 640, 480, false
		self.caption = "the mystic lines"
	end
	
	def draw
		if @x > 640 or @x < 1 then
			@xdir = -1 * @xdir
		end
		if @y > 480 or @y < 1 then
			@ydir = -1 * @ydir
		end
		if @x >= mouse_x and @x <= mouse_x+20 then
			if @y >= mouse_y and @y <= mouse_y+100 then
				@xdir = -1 * @xdir
			end
			if @y == mouse_y or @y == mouse_y+100 then
				@ydir = -1 * @ydir
			end
		end
		@x += @xdir
		@y += @ydir
		color = Gosu::Color.new(0xfff00000)
		draw_quad(mouse_x,mouse_y,color,mouse_x+20,mouse_y,color,mouse_x,mouse_y+100,color,mouse_x+20,mouse_y+100,color)
	        draw_quad(@x,@y,color,@x+5,@y,color,@x,@y+5,color,@x+5,@y+5,color) 
	end
	
	def update

	end
end

m = MainWindow.new
m.show
