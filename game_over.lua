local gOver = {}
local gOverImg

function gOver:enter()
	if gameover_state == 1 then
		if resources.possessions >= max_resources then
			gOverImg = imgs.WIN_pos
		elseif resources.relations >= max_resources then
			gOverImg = imgs.WIN_rel
		elseif resources.ego >= max_resources then
			gOverImg = imgs.WIN_ego
		end
		Gamestate.switch(gMenu)
	elseif gameover_state == -1 then
		if resources.possessions <= 0 then
			gOverImg = imgs.GO_pos
		elseif resources.relations <= 0 then
			gOverImg = imgs.GO_rel
		elseif resources.ego <= 0 then
			gOverImg = imgs.GO_ego
		end
		
	end
end

function gOver:mousereleased(x, y, click_type)
	x,y = TLfres.getMousePosition(1920,1080)
	Gamestate.switch(gMenu)
end

function gOver:mousereleased(key, scancode)
	if scancode == 'space' then
		Gamestate.switch(gMenu)
	end
end



function gOver:draw()
	TLfres.beginRendering(1920, 1080)
	love.graphics.draw(gOverImg,0,0)
	TLfres.endRendering({0,0,0,0})
end

	
	
return gOver