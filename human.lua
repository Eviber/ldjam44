require "pools"
Human = {wish, appearance = nil, toRemove = false}

Human.__index = Human

local function getwish()
	wishtype = wishesPool[math.random(#wishesPool)]
end

function Human:create(appearance)
	local hooman = {}
	setmetatable(hooman, Human)
	hooman.wish = getwish()
	print(#wishesPool)
	hooman.appearance = appearance
	hooman.toRemove = toRemove
	return hooman
end


return Human
