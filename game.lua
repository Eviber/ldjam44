
local gGame = {}
local spawned = 0

function gGame:init()
	relations = 20
	ego = 20
	possessions = 20
	cHuman = {wish, }
end

function gGame:enter()
    fire:start()
end

function gGame:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gPause)
  elseif scancode == "return" then
    spawned = 1
 elseif scancode == "backspace" then
    spawned = 0
   end
end

function gGame:update(dt)
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
 love.graphics.draw(imgs.sp_unit_b, 0, 0)
end

function drawgreen()
 love.graphics.draw(imgs.sp_unit_g, 0, 0)
end

function drawred()
 love.graphics.draw(imgs.sp_unit_r, 0, 0)
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
 -- vfx:draw()
	TLfres.endRendering()
end

return gGame
