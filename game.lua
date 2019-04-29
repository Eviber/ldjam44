local gGame = {}
local Human = require "human"
local lorraine = require "wish"
local utils = require "utils"
local spawned = false
local pop = false
local game_end = require "game_end"

require "pools"

local function rmHuman()
	sfx.bop:play()
	spawned = false
	pop = true
	Timer.after(0.1, function() pop = false end)
end

function gGame:init()
end

function gGame:enter()
	if fromMenu then
		cHuman = Human:create()
		Timer.after(0.25, function() spawned = true end)
		fire:start()
		fromMenu = false
		gameover_state = 0
	end
end

function gGame:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gPause)
	elseif scancode == "return" then
	elseif scancode == "backspace" then
	end
end

function gGame:keyreleased(key, scancode, irepeat)
	--print(scancode)
	if scancode == 'space' then
		--resolving contract outcome
		cHuman.toRemove = true
		if lorraine.grantWish() then
			accepted = true
			--animation tampon Accepted
		else
			denied = true
			--animation tampon X
			resources["relations"] = resources["relations"] - 20
			resources["possessions"] = resources["possessions"] - 20
			resources["ego"] = resources["ego"] - 20
		end
		Timer.after(0.25, function() accepted = false ; denied = false end)
		
		--checking for victory or defeat
		check_victory()
		check_defeat()
		
	end
	
	
	if utils:hasValue(scancode, {'1', '2', '3', '4', '5', '6', '7', '8', '9'}) then
		if cHuman.items[tonumber(scancode)] ~= nil then
			cHuman.items[tonumber(scancode)].checked = not cHuman.items[tonumber(scancode)].checked
		end
	end
end

function gGame:update(dt)
	if cHuman.toRemove then
		rmHuman()
		cHuman.toRemove = false
		Timer.after(0.5,
			function ()
				cHuman = Human:create()
				Timer.after(0.25, function() spawned = true end)
				fire:start()
			end)
	end
	fire:update(dt)
	Timer.update(dt)
end

function drawground()
	love.graphics.draw(imgs.sp_ground,0 ,0)
end

function drawpenta()
	love.graphics.draw(imgs.sp_penta,0,0)
end

function drawbg()
	love.graphics.draw(imgs.bg_back, 0, 0)
end

function drawbg2()
	love.graphics.draw(imgs.bg_front, 0, 0)
end

function drawcontract()
	love.graphics.draw(imgs.sp_cont, 0, 0)
end

function drawsatan_leg()
	love.graphics.draw(imgs.sp_satan2, 0, 0)
end

function drawsatan_top()
	love.graphics.draw(imgs.sp_satan1, 0, 0)
end

function drawdesk()
	love.graphics.draw(imgs.sp_desk, 0, 0)
end

function drawblue()
	love.graphics.draw(imgs.sp_unit_b, 0, 348 - (348 * resources.possessions / max_resources))
end

function drawgreen()
	love.graphics.draw(imgs.sp_unit_g, 0, 348 - (348 * resources.ego / max_resources))
end

function drawred()
	love.graphics.draw(imgs.sp_unit_r, 0, 348 - (348 * resources.relations / max_resources))
end

function drawclient()
	if spawned then
		love.graphics.draw(imgs.sp_pnj,0,0)
	elseif pop then
		love.graphics.draw(imgs.bop,900,620)
	end
end

function drawwindow()
	love.graphics.draw(imgs.sp_window, 0, 0)
end

local function drawstamp()
	if accepted then
		lg.draw(stamps.accepted)
	elseif denied then
		lg.draw(stamps.denied)
	end
end

function gGame:draw()
	TLfres.beginRendering(1920, 1080)
	drawbg()
	drawblue()
	drawred()
	drawgreen()
	drawbg2()
	drawground()
	drawpenta()
	drawsatan_leg()
	drawdesk()
	drawsatan_top()
	drawwindow()
	drawcontract()
	drawstamp()
	drawclient()

	lg.setColor(0, 0, 0)
	lg.print(cHuman.wish[1], 150, 150)
	local itemNumber = 0
	for i = 0, #cHuman.items do
		if cHuman.items[i] ~= nil then
			lg.setColor(unpack(cHuman.items[i].checked == true and {0,1,0} or {0,0,0}))
			itemNumber = itemNumber + 1
			lg.print((cHuman.items[i].str), 150, 200 + itemNumber* 30)
		end
	end

	lg.setColor(1,1,1)
	lg.print(resources.possessions, W-700, 100)
	lg.print(resources.relations, W-500, 100)
	lg.print(resources.ego, W-300, 100)
	
	vfx.draw()
	TLfres.endRendering()
end

return gGame
