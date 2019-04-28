local Class require"Class"

local button = Button:create(810, 800, 300, 100)
local Quit = love.graphics.newImage(button.img1)
local gCredits = {}

function gCredits:init()
end

function gCredits:enter()
  src1 = love.audio.newSource("assets/sfx/music/lulz.wav", "static")
  src1:play()
end

function gCredits:update(dt)
end

function gCredits:keypressed(key, scancode, isrepeat)
  if scancode == 'escape' then
    src1:stop()
    Gamestate.switch(gMenu)
	end
end

function gCredits:mousereleased(x, y, click_type)
  x,y = TLfres.getMousePosition(1920,1080)
  if button:isclicked(x,y) == true then
    src1:stop()
    Quit = love.graphics.newImage(button.img1)
    Gamestate.switch(gMenu)
  end
end   

function gCredits:mousepressed(x, y, click_type)
  x,y = TLfres.getMousePosition(1920,1080)
  if button:isclicked(x,y) == true then
    Quit = love.graphics.newImage(button.img2)
  end
end

function gCredits:draw()
  TLfres.beginRendering(1920, 1080)
  love.graphics.draw(LULZ, 0, 0)
  love.graphics.draw(Quit, button.x, button.y)
  TLfres.endRendering({0,0,0,0})
end

return gCredits