--Love2D Listeners
function love.mousepressed(x,y,button) input.mouseDown = button
	input.mouseDownX, input.mouseDownY = input.fixMouseCam(x,y) end
function love.mousereleased(x,y,button) input.mouseDown = nil end
function love.keypressed(key,isrepeat) input.keyDown = key end
function love.keyreleased(key) input.keyDown = nil end

--Input
input = {}

--Adjust Mouse Coordinates for Camera
function input.fixMouseCam(x,y)
	local x = x/camera.zoom-camera.x
	local y = y/camera.zoom-camera.y
	return x,y
end

--Set Mouse Position Variables
function input.getMousePos()
	local x,y = input.fixMouseCam(love.mouse.getX(),love.mouse.getY())
	input.mouseX,input.mouseY = x,y
	if input.mouseLX ~= nil and input.mouseLY ~= nil then
		input.mouseDX,input.mouseDY = x-input.mouseLX,y-input.mouseLY
	else input.mouseDX,input.mouseDY = 0,0
	end
	input.mouseLX,input.mouseLY = x,y
end

--Get Tile Mouse is over, considering height
function input.getMouseTile(xIso,yIso)
	local xGrid,yGrid = coord.Iso2Grid(xIso,yIso)
	for zkey,zvalue in ipairs(coord.sortPairsIn(map,2)) do
		local zxGrid,zyGrid = xGrid+(zvalue),yGrid+(zvalue)
		if map[zvalue][zyGrid] ~= nil then
			if map[zvalue][zyGrid][zxGrid] ~= nil then
				return zvalue, zyGrid, zxGrid
			end
		end
	end
	return 1,yGrid+1,xGrid+1
end

--Updater, Kind of Excessive for now.
function input.update()
	input.getMousePos()
end
