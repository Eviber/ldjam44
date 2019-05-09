require "button"

local btnPlay
local btnCred
local btnQuit

local gMenu = {}

function gMenu:init()
	tuto_on = true
	btnPlay = Button:create(1250, 150, 97, 90, btn.noclick, btn.click, function() Gamestate.switch(tuto_on and gTuto or gGame) end)
	btnCred = Button:create(1250, 350, 97, 90, btn.noclick, btn.click, function() Gamestate.switch(gCredits) end)
	btnQuit = Button:create(1250, 550, 97, 90, btn.noclick, btn.click, function() love.event.quit() end)
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
end

function gMenu:update(dt)
	cigar:update(dt)
end

function gMenu:draw()
	TLfres.beginRendering(1920, 1080)
	love.graphics.setColor(1,1,1,1)
	love.graphics.draw(MenuImg,0,0)
	btnPlay:draw()
	btnCred:draw()
	btnQuit:draw()
	lg.draw(cigar)
	--love.graphics.setColor(0,1,0,1)
	--lg.ellipse("line", cigarX, cigarY, cigarW, cigarH)
	love.graphics.setColor(1,1,1,1)
	--lg.draw(startscreen.hand)
	TLfres.endRendering({0,0,0,0})

end

function gMenu:mousepressed(x, y, click_type)
	btnPlay:onpress()
	btnCred:onpress()
	btnQuit:onpress()
end

function gMenu:mousereleased(x, y, click_type)
	btnPlay:onrelease()
	btnCred:onrelease()
	btnQuit:onrelease()
end   

function gMenu:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		love.event.quit()
	end
end

return gMenu
