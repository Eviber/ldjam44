local gGame = {}

function gGame:init()
	relations = 20
	ego = 20
	possessions = 20
	cHuman = {wish, }
end

function gGame:enter()
end

function gGame:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gMenu)
	end
end

function gGame:update(dt)
end

function drawbg()
	lg.setColor(0.5, 0.2, 0.2)
	lg.rectangle("fill", 0, 0, W, H)
end

function drawcontract()
	lg.setColor(0.8,0.8,0.8)
	lg.rectangle("fill", 50, 50, W/2-100, H-100)
end

function drawsatan()
	lg.setColor(0.4, 0.0, 0.0)
	lg.rectangle("fill", W - 200, H - 350, 150, 300)
end

function drawdesk()
	lg.setColor(90/255, 57/255, 33/255)
	lg.rectangle("fill", W - 550, H - 150, 300, 100)
end

function gGame:draw()
	TLfres.beginRendering(1920, 1080, true)
	drawbg()
	drawcontract()
	drawsatan()
	drawdesk()
	vfx.draw()
	TLfres.endRendering()
end

return gGame
