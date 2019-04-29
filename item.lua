local Item = {}

local function getItems()
	currentVal = 0
	IZGOOD = false
	while not IZGOOD do
		table.insert(cHuman.items, rdtb(itemsPool))
		currentVal = currentVal + cHuman.items[#cHuman.items].val
		if #cHuman.items > 12 then
			cHuman.items = {}
		else
			if currentVal >= cHuman.totVal * 0.9 then
				if currentVal <= cHuman.totVal * 1.1 then
					if #cHuman.items <= 3 then
						cHuman.items = {}
					else
						IZGOOD = true
					end
				else
					table.remove(cHuman.items, rd(#cHuman.items))
				end
			end
		end
	end

return Item