camera = {}
	camera.zoom = 4
	camera.x = 0
	camera.y = 0
	camera.speed = 0.7

--Updater
function camera.update()
	--Panning
	if input.mouseDown == "r" then
		camera.x = camera.x+input.mouseDX*camera.speed
		camera.y = camera.y+input.mouseDY*camera.speed
	end
	--Zoom
	if input.mouseDown == "wd" then
		camera.zoom = camera.zoom/2
		input.mouseDown = nil
		camera.fixCamZoom()
	elseif input.mouseDown =="wu" then
		camera.zoom = camera.zoom*2
		input.mouseDown = nil
		camera.fixCamZoom()
	end
end

--Zoom to Mouse fix
function camera.fixCamZoom()
	local x,y = input.mouseX,input.mouseY
	input.getMousePos()
	camera.x = camera.x-(x-input.mouseX)
	camera.y = camera.y-(y-input.mouseY)
end
