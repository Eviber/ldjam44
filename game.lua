local gGame = {}
local Human = require "human"
local lorraine = require "wish"
local utils = require "utils"
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
	print(scancode)
	if scancode == 'space' and lorraine.grantWish() then
		cHuman.toRemove = true
	end
	if utils:hasValue(scancode, {'1', '2', '3', '4', '5', '6', '7', '8', '9'}) then
		if cHuman.items[tonumber(scancode)] ~= nil then
			cHuman.items[tonumber(scancode)].checked = not cHuman.items[tonumber(scancode)].checked --(cHuman.items[tonumber(scancode)].checked == true and false or true)
		end
	end
end


function gGame:update(dt)
	if cHuman.toRemove then --temporary, will need to animate appearance and disappearance
		cHuman = Human:create()
	end
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
	lg.setColor(0, 0, 0)
	lg.print(cHuman.wish[1], 150, 150)
	local itemNumber = 0
	for i = 0, #cHuman.items do
		if cHuman.items[i] ~= nil then
			lg.setColor(unpack(cHuman.items[i].checked == true and {0,1,0} or {0,0,0}))
			itemNumber = itemNumber + 1
			lg.print((cHuman.items[i].i.str), 150, 200 + itemNumber* 30)
		end
	end

	lg.setColor(1,1,1)
	lg.print(resources.possessions, W-700, 100)
	lg.print(resources.relations, W-500, 100)
	lg.print(resources.ego, W-300, 100)
	TLfres.endRendering({0,1,0,1})
end

return gGame
