local Class = require"Class"

button = Button:create(800, 100, 300, 100)
button2 = Button:create(800, 300, 300, 100)
button3 = Button:create(800, 500, 300, 100)

local gMenu = {}

function gMenu:init()
end

function gMenu:enter()
end

function gMenu:update(dt)
end

function gMenu:draw()
	TLfres.beginRendering(1920, 1080)
  love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
	love.graphics.rectangle("fill", button2.x, button2.y, button2.w, button2.h)
  love.graphics.rectangle("fill", button3.x, button3.y, button3.w, button3.h)
	TLfres.endRendering({0,0,0,0})
end

function gMenu:mousepressed(x, y)
end

function gMenu:mousereleased(x, y, click_type)
 if button:isclicked(x,y) == true then
    Gamestate.switch(gGame)
  elseif button2:isclicked(x,y) == true then
    --Gamestate.switch(gCredits)
  elseif button3:isclicked(x,y) == true then
    love.event.quit()
  end
end   
  
function gMenu:keypressed(key, scancode, isrepeat)
	if scancode == 'space' then
    Gamestate.switch(gGame)
  elseif scancode == 'escape' then
		love.event.quit()
	end
end

return gMenu
