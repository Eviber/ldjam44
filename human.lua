require "pools"
require "name"
local Item = require "item"

Human = {wish, items, appearance = nil, toRemove = false}

Human.__index = Human


local function getwish()
	return rdtb(rdtb(wishesPool))
end


local function sortitems(items)
	local function s(a,b)
		if (a.i.cat == b.i.cat) then
			return (a.i.str < b.i.str)
		else
			return (a.i.cat < b.i.cat)
		end
	end
	table.sort(items, s)
end

local function getItems()
	local items = {}

	for i = 1, rd(20) do
		items[i] = {
			i = itemsPool[rd(#itemsPool)],
			check = false,
		}
	end
	sortitems(items)
	--[[
	for i = 1, #itemsPool do
	if items[i] then
	print(items[i].i.str)
	end
	end
	print()
	]]
	return items
end

function Human:create(appearance)
	local hooman = {}
	setmetatable(hooman, Human)
	hooman.wish = getwish()
	hooman.name = gibName()
	--print("Name: " .. hooman.name)
	hooman.ratio = rdtb({1.25, 1.5, 2})
	hooman.totVal = math.max(100, hooman.wish[2] * rdtb({1.8, 2.0, 2.2}))
	--hooman.items = {}
	hooman.items = Item:getItems(hooman)
	--hooman.items = getItems()
	hooman.appearance = appearance
	hooman.toRemove = toRemove

	return hooman
end

return Human
