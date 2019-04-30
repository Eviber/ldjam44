require "button"
tuto_on = true

local button = Button:create(1250, 150, 97, 90)
local button2 = Button:create(1250, 350, 97, 90)
local button3 = Button:create(1250, 550, 97, 90)
local NewGame = love.graphics.newImage(button.img1)
local Credits = love.graphics.newImage(button2.img1)
local Quit = love.graphics.newImage(button3.img1)
CreditsImg = love.graphics.newImage("assets/img/Credits.jpg")
MenuImg = love.graphics.newImage("assets/img/bg_menu.png")

local gMenu = {}

function gMenu:init()
end

function gMenu:enter()
	resources = {relations = 1000, ego = 1000, possessions = 1000}
	cHuman = Human:create()
	fromMenu = true
	accepted = false
	denied = false
	Timer.clear()
	fire:stop()
	cigar:start()
end

function gMenu:leave()
	--cigar:stop()
end

function gMenu:update(dt)
	cigar:update(dt)
end

function gMenu:draw()
	love.graphics.setColor(1,1,1,1)
	TLfres.beginRendering(1920, 1080)
	love.graphics.draw(MenuImg,0,0)
	love.graphics.draw(NewGame, button.x, button.y)
	love.graphics.draw(Credits, button2.x, button2.y)
	love.graphics.draw(Quit, button3.x, button3.y)
	lg.draw(cigar)
	--love.graphics.setColor(0,1,0,1)
	--lg.ellipse("line", cigarX, cigarY, cigarW, cigarH)
	love.graphics.setColor(1,1,1,1)
	--lg.draw(startscreen.hand)
	TLfres.endRendering({0,0,0,0})

end

function gMenu:mousepressed(x, y, click_type)
	x,y = TLfres.getMousePosition(1920,1080)
	if button:isclicked(x,y) == true then
		NewGame = love.graphics.newImage(button.imgN)
	elseif button2:isclicked(x,y) == true then
		Credits = love.graphics.newImage(button2.imgC)
	elseif button3:isclicked(x,y) == true then
		Quit = love.graphics.newImage(button3.imgQ)
	end
end

function gMenu:mousereleased(x, y, click_type)
	x,y = TLfres.getMousePosition(1920,1080)
	if button:isclicked(x,y) == true then
		NewGame = love.graphics.newImage(button.img1)
		if tuto_on == true then
			Gamestate.switch(gTuto)
		elseif tuto_on == false then
			Gamestate.switch(gGame)
		end
	elseif button2:isclicked(x,y) == true then
		Credits = love.graphics.newImage(button2.img1)
		Gamestate.switch(gCredits)
	elseif button3:isclicked(x,y) == true then
		Quit = love.graphics.newImage(button3.img1)
		love.event.quit()
	end
end   

function gMenu:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		love.event.quit()
	end
end

return gMenu
