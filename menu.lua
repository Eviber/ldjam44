local gMenu = {}

function gMenu:init()
end

function gMenu:enter()
end

function gMenu:update(dt)
end

function gMenu:draw()
	TLfres.beginRendering(1920, 1080)
	lg.print("Press Space")
	TLfres.endRendering({0,0,0,0})
end

function gMenu:keypressed(key, scancode, isrepeat)
	if key == "space" then
		Gamestate.switch(gGame)
	elseif scancode == 'escape' then
		love.event.quit()
	end
end

return gMenu
