local class = require "middleclass"
local Luvent = require "Luvent"

local Enemy = class("Enemy")

Enemy.static.LIVING = {}

function Enemy:initialize(family, maxHp)
  self.family = family
  self.maxHp = maxHp
  self.Hp = maxHp
  table.insert(Enemy.LIVING, self)
end

Enemy.static.onDie = Luvent.newEvent()

function Enemy:damage(damage)
  self.Hp = self.Hp - damage
  if self.Hp <= 0 then
    Enemy.onDie:trigger(self)
  end
end

Enemy.onDie:addAction(
  function (enemy)
    for index, living_enemy in ipairs(Enemy.LIVING) do
      if enemy == living_enemy then
        table.remove(Enemy.LIVING, index)
        return
      end
    end
  end
)

local debugAction = Enemy.onDie:addAction(
  function (enemy)
    print(string.format("Enemy %s died", enemy.family))
  end
)

local bee = Enemy:new("Bee", 10)
local ladybug = Enemy:new("Ladybug", 1)

print(#Enemy.LIVING)

ladybug:damage(100)
print(#Enemy.LIVING)

Enemy.onDie:removeAction(debugAction)
bee:damage(50)
print(#Enemy.LIVING)

-------------------------------------------------------------------------
