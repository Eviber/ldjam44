local game_end = {}
--return gMenu

function check_victory()
	if resources.possessions >= max_resources or resources.relations >= max_resources or resources.ego >= max_resources then
		gameover_state = 1
		Gamestate.switch(gOver)
	end
end


function check_defeat()
	if resources.possessions <= 0 or resources.relations <= 0 or resources.ego <= 0 then
		gameover_state = -1
		Gamestate.switch(gOver)
	end	
end


return game_end