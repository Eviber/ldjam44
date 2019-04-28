local Class = require"Class"
lulzvar = 0
button = Button:create(1400, 300, 300, 100)
button2 = Button:create(1400, 500, 300, 100)
button3 = Button:create(1400, 700, 300, 100)
NewGame = love.graphics.newImage(button.img1)
Credits = love.graphics.newImage(button2.img1)
Quit = love.graphics.newImage(button3.img1)
LULZ = love.graphics.newImage("assets/img/Credits.jpg")

local gMenu = {}

function gMenu:init()
end

function gMenu:enter()
end

function gMenu:update(dt)
end

function gMenu:draw()
  love.graphics.setColor(1,1,1,1)
	TLfres.beginRendering(1920, 1080)
  love.graphics.draw(NewGame, button.x, button.y)
  love.graphics.draw(Credits, button2.x, button2.y)
  love.graphics.draw(Quit, button3.x, button3.y)
	TLfres.endRendering({0,0,0,0})
end

function gMenu:mousepressed(x, y, click_type)
  x,y = TLfres.getMousePosition(1920,1080)
   if button:isclicked(x,y) == true then
    NewGame = love.graphics.newImage(button.img2)
  elseif button2:isclicked(x,y) == true then
    Credits = love.graphics.newImage(button2.img2)
  elseif button3:isclicked(x,y) == true then
    Quit = love.graphics.newImage(button3.img2)
  end
end

function gMenu:mousereleased(x, y, click_type)
  x,y = TLfres.getMousePosition(1920,1080)
 if button:isclicked(x,y) == true then
    NewGame = love.graphics.newImage(button.img1)
    Gamestate.switch(gGame)
  elseif button2:isclicked(x,y) == true then
    Credits = love.graphics.newImage(button2.img1)
    Gamestate.switch(gCredits)
  elseif button3:isclicked(x,y) == true then
    Quit = love.graphics.newImage(button3.img1)
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
