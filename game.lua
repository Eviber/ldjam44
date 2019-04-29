local gGame = {}
local Human = require "human"
local lorraine = require "wish"
local utils = require "utils"
local spawned = 0

require "pools"

function gGame:init()
	resources = {relations = 20, ego = 20, possessions = 20}
	cHuman = Human:create()
end

function gGame:enter()
end

function gGame:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gPause)
  elseif scancode == "return" then
    spawned = 1
    fire:start()
 elseif scancode == "backspace" then
    spawned = 0
	sfx.bop:play()
	fire:stop()
   end
end

function gGame:keyreleased(key, scancode, irepeat)
	--print(scancode)
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
    fire:update(dt)
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

function drawcontract_shadow()
  love.graphics.draw(imgs.sp_cont_s, 0, 0)
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
 love.graphics.draw(imgs.sp_unit_b, 0, 348 - (348 * resources.possessions / 100))
end

function drawgreen()
 love.graphics.draw(imgs.sp_unit_g, 0, 348 - (348 * resources.relations / 100))
end

function drawred()
 love.graphics.draw(imgs.sp_unit_r, 0, 348 - (348 * resources.ego / 100))
end

function drawclient()
  if spawned == 1 then 
    love.graphics.draw(imgs.sp_pnj,0,0)
  elseif spawned == 0 then
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
  drawcontract()
  drawcontract_shadow()
  drawclient()

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
	vfx.draw()
	TLfres.endRendering()
end

return gGame
