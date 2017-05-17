class = require 'lib/middleclass'
require 'ext/panel'
-- require "lib/camera_small"
-- require "lib/input"

tile_height = 64
tile_width = 64

start_x = 208
start_y = 208

function love.load()
  gridPanel = GridPanel:new(32, 32, 400, 400, 32, 32)

  image = love.graphics.newImage("assets/ISO_LowTile_Dirt_01.png")
  local vertices = {
		{
			-- top-left corner (red-tinted)
			0, 0, -- position of the vertex
			0, 0, -- texture coordinate at the vertex position
			255, 0, 0, -- color of the vertex
		},
		{
			-- top-right corner (green-tinted)
			image:getWidth(), 0,
			1, 0, -- texture coordinates are in the range of [0, 1]
			0, 255, 0
		},
		{
			-- bottom-right corner (blue-tinted)
			image:getWidth(), image:getHeight(),
			1, 1,
			0, 0, 255
		},
		{
			-- bottom-left corner (yellow-tinted)
			0, image:getHeight(),
			0, 1,
			255, 255, 0
		},
	}

	-- the Mesh DrawMode "fan" works well for 4-vertex Meshes.
	mesh = love.graphics.newMesh(vertices, "fan")
  mesh:setTexture(image)

end

function love.update(dt)
  -- camera:update(dt)
end

function love.draw()
  -- love.graphics.scale(camera.zoom,camera.zoom)
	-- love.graphics.translate(camera.x,camera.y)

  gridPanel:draw()

  love.graphics.draw(mesh, 0, 0)

	-- love.graphics.setColor(231, 76, 60)
  --
  -- rotatedRectangle('fill', start_x, start_y, tile_width, tile_height, math.pi / 4)
  --
  -- love.graphics.line(0, start_y + tile_height / 2, love.graphics.getWidth(), start_y + tile_height / 2)
  -- love.graphics.line(start_x + tile_width / 2, 0, start_x + tile_width / 2, love.graphics.getHeight())
end

function rotatedRectangle( mode, x, y, w, h, rx, ry, segments, r, ox, oy )
	-- Check to see if you want the rectangle to be rounded or not:
	if not oy and rx then r, ox, oy = rx, ry, segments end
	-- Set defaults for rotation, offset x and y
	r = r or 0
	ox = ox or w / 2
	oy = oy or h / 2
	-- You don't need to indent these; I do for clarity
	love.graphics.push()
		love.graphics.translate( x + ox, y + oy )
		love.graphics.push()
			love.graphics.rotate( -r )
			love.graphics.rectangle( mode, -ox, -oy, w, h, rx, ry, segments )
		love.graphics.pop()
	love.graphics.pop()
end
