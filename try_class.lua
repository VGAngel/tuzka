local class = require "lib/middleclass"

local Fruit = class('Fruit')

function Fruit:initialize(sweetness)
  self.sweetness = sweetness
end

Fruit.static.sweetness_threshold = 5

function Fruit:isSweet()
  return self.sweetness > Fruit.sweetness_threshold
end

local Lemon = class('Lemon', Fruit)

function Lemon:initialize()
  Fruit.initialize(self, 1)
end

local lemon = Lemon:new()

print(lemon:isSweet())
