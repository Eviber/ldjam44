require "pools"
Human = {wish, appearance = nil, toRemove = false}

Human.__index = Human

function Human:create(appearance)
	local hooman = {}
	setmetatable(hooman, Human)
	hooman.wish = wishesPool[math.random(#wishesPool)]
	hooman.appearance = appearance
	hooman.toRemove = toRemove
	return hooman
end


return Human