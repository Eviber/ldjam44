local gTuto = {}

local btnSkip
local var_s = 1

function gTuto:init()
	btnSkip = Button:create(1600, 960, 97, 90, btn.noclick, btn.click, function() tuto_on = false ; Gamestate.switch(gGame) end)
end

function gTuto:enter()
end

function gTuto:update(dt)
end

function sliders()
	if var_s < 14 then
		love.graphics.draw(slide[var_s],0,0)
	else
		tuto_on = false
		Gamestate.switch(gGame)
	end
end

function gTuto:draw()
	love.graphics.setColor(1,1,1,1)
	TLfres.beginRendering(1920, 1080)
	sliders()
	love.graphics.draw(tuto_skip,0,0)
	btnSkip:draw()
	TLfres.endRendering({0,0,0,0})
end

function gTuto:mousepressed(x, y, click_type)
	btnSkip:onpress()
end

function gTuto:mousereleased(x, y, click_type)
	btnSkip:onrelease()
	if not btnSkip:ishover() then
		var_s = var_s + 1
	end
end   

function gTuto:keypressed(key, scancode, isrepeat)
	if scancode == 'space' then
		var_s = var_s + 1
	end
end

return gTuto
