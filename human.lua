require "pools"
Human = {wish, appearance = nil, toRemove = false}

Human.__index = Human

function Human:create(wish, appearance)
	local hooman = {}
	setmetatable(hooman, Human)
	human.wish = wishesPool[math.random(#wishesPool)]
	human.appearance = appearance
	human.toRemove = toRemove
	return hooman
end


return Human