local gPause = {}

local btnResume
local btnQuit
local Pause
local Vignette

function gPause:init()
	btnResume = Button:create(600, 400, 97, 90, btn.noclick, btn.click, function() Gamestate.switch(gGame) end)
	btnQuit = Button:create(600, 600, 97, 90, btn.noclick, btn.click, function() Gamestate.switch(gMenu) end)
	Pause = lg.newImage("assets/img/sprite_pause.png")
	Vignette = lg.newImage("assets/img/Vignette.png")
end

function gPause:enter()
end

function gPause:update(dt)
end

function gPause:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gGame)
	end
end

function gPause:mousereleased(x, y, click_type)
	btnResume:onrelease()
	btnQuit:onrelease()
end   

function gPause:mousepressed(x, y, click_type)
	btnResume:onpress()
	btnQuit:onpress()
end

function gPause:draw()
	gGame:draw()
	TLfres.beginRendering(W,H)
	lg.setColor(1,1,1,1)
	lg.draw(Vignette, 0, 0)
	lg.draw(Pause, 0, 0)
	btnResume:draw()
	btnQuit:draw()
	TLfres.endRendering({0,0,0,0})
end

return gPause
