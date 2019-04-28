local gGame = {}
local Human = require "human"
local loraine = require "wish"
require "pools"

function gGame:init()
	resources = {relations = 20, ego = 20, possessions = 20}
	cHuman = Human:create()
end

function gGame:enter()
end

function gGame:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gMenu)
	end
end

function gGame:keyreleased(key, scancode, irepeat)
	if scancode == 'space' then
		cHuman.toRemove = true
		loraine.grantWish()
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
	lg.setColor(0/255,111/255,158/255)
	lg.rectangle("fill", W - 700, 450, 100, - 4*resources.possessions)
	lg.setColor(226/255,67/255,75/255)
	lg.rectangle("fill", W - 500, 450, 100, - 4*resources.relations)
	lg.setColor(134/255,192/255,106/255)
	lg.rectangle("fill", W - 300, 450, 100, - 4*resources.ego)
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
	lg.setColor(1, 1, 1)
	lg.print(cHuman.wish[1])
	lg.print(resources.relations, 0, 50)
	lg.print(resources.possessions, 0, 100)
	lg.print(resources.ego, 0, 150)
	TLfres.endRendering({0,1,0,1})
end

return gGame
