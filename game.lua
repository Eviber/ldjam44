local gGame = {}
local Human = require "human"
local lorraine = require "wish"
local utils = require "utils"
local spawned = false
local pop = false
local game_end = require "game_end"

require "pools"

function gGame:init()
	pcig:start()
	tick_tab = {}

	for i = 1, 10 do
		local x = i > 5 and 450 or 150
		local y = 380 + (i-1)%5 * 80
		tick_tab[i] = Button:create(x, y, 67, 67, btn.untick, btn.tick, false, true, 10, 32)
	end
end

function gGame:enter()
	if fromMenu then
		cHuman = Human:create()

		for i = 1, #cHuman.items do
			tick_tab[i].clicked = false
		end
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

local function sealcontract()
	cHuman.toRemove = true
	if lorraine.grantWish() then
		accepted = true
	else
		denied = true
		resources["relations"] = resources["relations"] - 20
		resources["possessions"] = resources["possessions"] - 20
		resources["ego"] = resources["ego"] - 20
	end
	Timer.after(0.5, function() accepted = false ; denied = false end)

	check_victory()
	check_defeat()
end

function gGame:keyreleased(key, scancode, isrepeat)
	if scancode == 'space' then
		sealcontract()
	end
end

local function rmHuman()
	sfx.bop:play()
	spawned = false
	pop = true
	Timer.after(0.1, function() pop = false end)
end

function gGame:update(dt)
	if cHuman.toRemove then
		rmHuman()
		cHuman.toRemove = false
		Timer.after(0.5,
		function ()
			cHuman = Human:create()

			for i = 1, #cHuman.items do
				tick_tab[i].clicked = false
			end
			Timer.after(0.25, function() spawned = true end)
			fire:start()
		end)
	end
	fire:update(dt)
	pcig:update(dt)
	Timer.update(dt)
end

local function drawbg()
	lg.setColor(1,1,1)
	love.graphics.draw(imgs.bg_back, 826, 194)
	love.graphics.draw(imgs.sp_unit_b, 0, 348 - (348 * resources.possessions / max_resources))
	love.graphics.draw(imgs.sp_unit_r, 0, 348 - (348 * resources.relations / max_resources))
	love.graphics.draw(imgs.sp_unit_g, 0, 348 - (348 * resources.ego / max_resources))
	love.graphics.draw(imgs.bg_front, 0, 0)
	love.graphics.draw(imgs.sp_ground,0 ,782)
	love.graphics.draw(imgs.sp_penta,991,882)
	love.graphics.draw(imgs.sp_chair, 1567, 86)
	love.graphics.draw(imgs.sp_satan2, 1406, 675)
	love.graphics.draw(imgs.sp_desk, 1204, 611)
	love.graphics.draw(imgs.deskvials, 1298, 520)
	lg.draw(pcig)
	love.graphics.draw(imgs.sp_satan1, 1418, 132)
	love.graphics.draw(imgs.sp_window, 297, 121)
end

local function drawfioles()
	local n = 0
	if cHuman.wish[2] == 500 then -- oof c'est degeu
		n = 4
	elseif cHuman.wish[2] >= 250 then
		n = 3
	elseif cHuman.wish[2] >= 150 then
		n = 2
	elseif cHuman.wish[2] >= 100 then
		n = 1
	end
	for i = 0, n do
		lg.draw(fiole[cHuman.wish[3]], 363 + 73 * i, 211)
	end
end

local function drawclip()
	if cHuman.ratio == 1.25 then
		lg.draw(clip.r, 124, 33)
	elseif cHuman.ratio == 1.5 then
		lg.draw(clip.y, 124, 33)
	elseif cHuman.ratio == 2 then
		lg.draw(clip.g, 124, 33)
	end
end

local function drawcontract()
	love.graphics.draw(imgs.sp_cont, 66, 76)
	--love.graphics.draw(imgs.sp_photo,0,0)
	drawfioles()
	drawclip()

	lg.setFont(fonts.wishFont)
	lg.setColor(0, 0, 0)
	lg.print(cHuman.wish[1], 363, 105)
	lg.setFont(fonts.itemFont)
	lg.setColor(1,1,1)
	for i = 1, #cHuman.items do
		lg.draw(symbol[cHuman.items[i].cat],tick_tab[i].x + 17,tick_tab[i].y + 40)
		lg.print(cHuman.items[i].str, tick_tab[i].x + 91, tick_tab[i].y + 42)
		tick_tab[i]:draw()
	end

	lg.setColor(0,0,0)
	lg.setFont(fonts.spaceFont)
	lg.print("Press Space to make an offer", 270, 810)
end

local function drawclient()
	if spawned then
		love.graphics.draw(imgs.sp_pnj,993,532)
	elseif pop then
		love.graphics.draw(imgs.bop,900,620)
	end
end

local function drawstamp()
	lg.setColor(1,1,1)
	if accepted then
		lg.draw(stamps.accepted, 118, 106)
	elseif denied then
		lg.draw(stamps.denied, 118, 106)
	end
end

function gGame:draw()
	TLfres.beginRendering(1920, 1080)
	drawbg()
	drawclient()
	drawcontract()
	drawstamp()
	vfx.draw()
	TLfres.endRendering()
end

function gGame:mousepressed(x, y, click_type)
	for i = 1, #tick_tab do
		tick_tab[i]:onpress()
		if tick_tab[i]:ishover() == true then
			if cHuman.items[i] ~= nil then
				cHuman.items[i].checked = not cHuman.items[i].checked
			end
		end
	end
end  

return gGame
