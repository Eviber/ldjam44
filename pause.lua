local Class require"Class"
local img = "/assets/img/sprite_pause.png"
local vin = "/assets/img/Vignette.png"
local button = Button:create(600, 400, 97, 90)
local button2 = Button:create(600, 600, 97, 90)
local Resume = love.graphics.newImage(button.img1)
local Quit = love.graphics.newImage(button2.img1)
local Pause = love.graphics.newImage(img)
local Vignette = love.graphics.newImage(vin)


local gPause = {}

function gPause:init()
end

function gPause:enter()
  gGame:draw()
end

function gPause:update(dt)
end

function gPause:keypressed(key, scancode, isrepeat)
  if scancode == 'escape' then
    Gamestate.switch(gGame)
  end
end

function gPause:mousereleased(x, y, click_type)
 x,y = TLfres.getMousePosition(1920,1080)
 if button:isclicked(x,y) == true then
    Resume = love.graphics.newImage(button.img1)
    Gamestate.switch(gGame)
  elseif button2:isclicked(x,y) == true then
    Quit = love.graphics.newImage(button2.img1)
    Gamestate.switch(gMenu)
  end
end   

function gPause:mousepressed(x, y, click_type)
      x,y = TLfres.getMousePosition(1920,1080)
   if button:isclicked(x,y) == true then
    Resume = love.graphics.newImage(button.img2)
  elseif button2:isclicked(x,y) == true then
    Quit = love.graphics.newImage(button2.img2)
  end
end

function gPause:draw()
  gGame:draw()
  love.graphics.setColor(1,1,1,1)
  TLfres.beginRendering(1920, 1080)
  love.graphics.draw(Vignette, 0, 0)
  love.graphics.draw(Pause, 0, 0)
  love.graphics.draw(Resume, button.x, button.y)
  love.graphics.draw(Quit, button2.x, button2.y)
  TLfres.endRendering({0,0,0,0})
end

return gPause