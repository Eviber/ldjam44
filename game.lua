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
    love.graphics.setColor(1,1,1,1)
		Gamestate.switch(gPause)
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

function drawclient()
	lg.setColor(90/255, 90/255, 90/255)
	lg.rectangle("fill", W - 700, H - 300, 100, 250)
end

function drawtruc()
	lg.setColor(226/255,67/255,75/255)
	lg.rectangle("fill", W - 700, 50, 100, 400)
	lg.setColor(0/255,111/255,158/255)
	lg.rectangle("fill", W - 500, 50, 100, 400)
	lg.setColor(134/255,192/255,106/255)
	lg.rectangle("fill", W - 300, 50, 100, 400)
end

function gGame:draw()
	TLfres.beginRendering(1920, 1080)
	drawbg()
	drawcontract()
	drawsatan()
	drawdesk()
	drawclient()
	drawtruc()
	vfx.draw()
	TLfres.endRendering()
end

return gGame
