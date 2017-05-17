local class = require "lib/middleclass"

Panel = class('Panel')

function Panel:initialize(start_x, start_y, size_x, size_y)
  self.start_x = start_x
  self.start_y = start_y
  self.size_x = size_x
  self.size_y = size_y
end

function Panel:draw()
  love.graphics.setColor(102, 205, 170)
  love.graphics.rectangle("line", self.start_x, self.start_y, self.size_x, self.size_y)
  love.graphics.rectangle("line", self.start_x - 1, self.start_y - 1, self.size_x + 2, self.size_y + 2)
end

GridPanel = class('GridPanel', Panel)

function GridPanel:initialize(start_x, start_y, size_x, size_y, tile_width, tile_height)
  Panel.initialize(self, start_x, start_y, size_x, size_y)
  self.tile_width = tile_width
  self.tile_height = tile_height
end

function GridPanel:draw()
  love.graphics.setColor(192, 192, 192)
  local tiles_x = self.size_x / self.tile_width
  local tiles_y = self.size_y /self.tile_height
  for i = 1, tiles_x do
    for j = 1, tiles_y do
      love.graphics.rectangle("line", self.start_x + self.tile_width * (i - 1) , self.start_y + self.tile_height * (j - 1), self.tile_height, self.tile_width)
    end
  end
end
