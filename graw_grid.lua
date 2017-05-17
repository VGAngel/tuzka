class = require 'lib/middleclass'

tile_height = 32
tile_width = 32

size_x = 10
size_y = 10

start_x = 100
start_y = 100

function love.load()
	cam = camera:new(10, 10, 1, 1)
end

function love.update(dt)

end

function love.draw()
	love.graphics.setColor(231, 76, 60)
	for i=1,size_x do
		for j=1,size_y do
			love.graphics.rectangle("line", start_x + tile_width * (i - 1) , start_y + tile_height * (j - 1), tile_height, tile_width)
		end
	end
	camera.draw()
end
