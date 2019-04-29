local game_end = {}
--return gMenu

function check_victory()
	if resources.possessions >= max_resources or resources.relations >= max_resources or resources.ego >= max_resources then
		Gamestate.switch(gMenu)
	end
end


return game_end