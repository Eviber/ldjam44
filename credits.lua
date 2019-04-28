local Class require"Class"

local button = Button:create(230, 870, 300, 100)
local Quit = love.graphics.newImage(button.img1)
local gCredits = {}

local function Isin(x,y,x2,y2)
  if x > x2 and x<  x2 + 40 and y > y2 and y < y2 + 40 then
    return true
  else 
    return false
  end
end

function gCredits:init()
end

function gCredits:enter()
end

function gCredits:update(dt)
end

function gCredits:keypressed(key, scancode, isrepeat)
  if scancode == 'escape' then
    Gamestate.switch(gMenu)
	end
end

function gCredits:mousereleased(x, y, click_type)
  x,y = TLfres.getMousePosition(1920,1080)
  if button:isclicked(x,y) == true then
    Quit = love.graphics.newImage(button.img1)
    Gamestate.switch(gMenu)
  end
  if Isin(x,y,560,458) == true then
    love.system.openURL("https://github.com/eclahn")
  elseif Isin(x,y,619,458) == true then
    love.system.openURL("https://twitter.com/EHaamu")
  elseif Isin(x,y,506,504) == true then
    love.system.openURL("https://github.com/eviber")
  elseif Isin(x,y,560,504) == true then
    love.system.openURL("https://twitter.com/youvaaaaa")
  elseif Isin(x,y,506,552) == true then
    love.system.openURL("https://github.com/yarypert")
  elseif Isin(x,y,506,762) == true then
    love.system.openURL("https://www.instagram.com/boudoumgredon/")
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
  love.graphics.draw(CreditsImg, 0, 0)
  love.graphics.draw(Quit, button.x, button.y)
  TLfres.endRendering({0,0,0,0})
end

return gCredits