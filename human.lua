require "pools"
Human = {wish, appearance = nil, toRemove = false}

Human.__index = Human

local function rdtb(tbl)
	return (tbl[math.random(#tbl)])
end

local function getwish()
	return rdtb(rdtb(wishesPool))
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
