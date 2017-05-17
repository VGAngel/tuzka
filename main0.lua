background = love.graphics.newImage("assets/2D-Triangle-Landscape.jpg")

function love.load()

end

 function love.draw()
 love.graphics.draw(background)
  for i = 0, love.graphics.getWidth() / background:getWidth() do
    for j = 0, love.graphics.getHeight() / background:getHeight() do
      love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
    end
  end
end  
--
--
-- block_width = 64
-- block_height = 64
-- block_depth = block_height / 2
--
-- grid_size = 10
-- grid = {}
-- for x = 1,grid_size do
--    grid[x] = {}
--    for y = 1,grid_size do
--       grid[x][y] = 1
--    end
-- end
--   for x = 1,grid_size do
-- 		for y = 1,grid_size do
-- 			if grid[x][y] == 1 then
-- 				love.graphics.draw(ground,
-- 					grid_x + ((y-x) * (block_width / 2)),
-- 					grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size/2)))
--
-- 			else -- grid[x][y] == 2 then
-- 				love.graphics.draw(highlight,
-- 					grid_x + ((y-x) * (block_width / 2)),
-- 					grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size/2)))
-- 			end
--
-- 			if grid[x][y] == 3 then
-- 				love.graphics.draw(hlgreen,
-- 					grid_x + ((y-x) * (block_width / 2)),
-- 					grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size/2)))
-- 			end
--
-- 		end
-- 	end
--
--  end
