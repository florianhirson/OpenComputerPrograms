local robot = require("robot")
local c = require("component")
local ic = c.inventory_controller
local sides = require("sides")
local side = sides.front

function isRobotInvEmpty()
  vide = true
  size = robotInvSize()
  robot.select(1)           
  if size == 0 then
    return true
  end
  for i = 1, size do
    if robot.count(i) ~= 0 then
      vide = false
    end
  end
  return vide 
end

function robotInvSize()
  return robot.inventorySize()
end

function transferItems()
  print("Begin transferring items")
  robot.turnRight()
  for i = 1, 10 do
    ic.suckFromSlot(side, i, 1)
  end
  robot.turnLeft()
  print("Items transfer : done")
end   
   
print(isRobotInvEmpty())
transferItems()
