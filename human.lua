require "pools"
require "name"

Human = {wish, items, appearance = nil, toRemove = false}

Human.__index = Human

local function rdtb(tbl)
	return (tbl[rd(#tbl)])
end

local function getwish()
	return rdtb(rdtb(wishesPool))
end

local function getitems()
	local items = {}

	for i = 1, rd(20) do
		id = rd(#pricesPool)
		if items[id] == nil then
			items[id] = {
				n = 1,
				i = pricesPool[id],
			}
		else
			items[id].n = items[id].n + 1
		end
	end
	for i = 1, #pricesPool do
		if items[i] then
			print(items[i].i.str, items[i].n)
		end
	end
	print()
	return items
end

function Human:create(appearance)
	local hooman = {}
	setmetatable(hooman, Human)
	hooman.wish = getwish()
	hooman.name = gibName()
	print("Name: " .. hooman.name)
	hooman.items = getitems()
	hooman.appearance = appearance
	hooman.toRemove = toRemove
	return hooman
end

return Human
