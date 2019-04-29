local Item = {}

function Item:getItems(human)
	currentVal = 0
	IZGOOD = false
	while not IZGOOD do
		cp = shallowcopy(rdtb(itemsPool))
		table.insert(human.items, cp)
		currentVal = currentVal + human.items[#human.items].val
		print(currentVal, cp.val, human.totVal, cp.str)
		if #human.items > 12 then
			human.items = {}
		else
			if currentVal >= human.totVal then
				if #human.items <= 3 then
					human.items = {}
					currentVal = 0
					print()
				else
					IZGOOD = true
				end
			end
		end
	end
end


return Item
