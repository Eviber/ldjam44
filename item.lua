local Item = {}

function Item:getItems(human)
	currentVal = 0
	IZGOOD = false
	while not IZGOOD do
		table.insert(human.items, rdtb(itemsPool))
		currentVal = currentVal + human.items[#human.items].val
		if #human.items > 12 then
			human.items = {}
		else
			if currentVal >= human.totVal * 0.9 then
				if currentVal <= human.totVal * 1.1 then
					if #human.items <= 3 then
						human.items = {}
					else
						IZGOOD = true
					end
				else
					currentVal = currentVal - human.items[#human.items].val
					table.remove(human.items, #human.items)
				end
			end
		end
	end
end


return Item