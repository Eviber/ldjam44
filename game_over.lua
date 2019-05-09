local gOver = {}
local gOverImg

function gOver:enter()
	if gameover_state == 1 then
		if resources.possessions >= max_resources then
			gOverImg = lg.newImage("assets/img/win_pos.png")
		elseif resources.relations >= max_resources then
			gOverImg = lg.newImage("assets/img/win_rel.png")
		elseif resources.ego >= max_resources then
			gOverImg = lg.newImage("assets/img/win_ego.png")
		end
	elseif gameover_state == -1 then
		if resources.possessions <= 0 then
			gOverImg = lg.newImage("assets/img/game_over_pos.png")
		elseif resources.relations <= 0 then
			gOverImg = lg.newImage("assets/img/game_over_rel.png")
		elseif resources.ego <= 0 then
			gOverImg = lg.newImage("assets/img/game_over_ego.png")
		end

	end
end

function gOver:mousereleased(x, y, click_type)
	Gamestate.switch(gMenu)
end

function gOver:keyreleased(key, scancode)
	if scancode == 'space' then
		Gamestate.switch(gMenu)
	end
end

function gOver:draw()
	TLfres.beginRendering(W,H)
	love.graphics.draw(gOverImg,0,0)
	TLfres.endRendering()
end

return gOver
