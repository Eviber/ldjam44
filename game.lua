local gGame = {}

function gGame:init()
	gameWorld = world:create("game")
end

function gGame:enter()
end

function gGame:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gMenu)
	end
end

function gGame:update(dt)
	world:update(dt)
end

function gGame:draw()
	TLfres.beginRendering(1920, 1080)
	--world:draw()
	vfx.draw()
	TLfres.endRendering()
end

return gGame
