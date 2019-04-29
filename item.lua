local Item = {}

function Item:getItems(human)
	currentVal = 0
	IZGOOD = false
	items = {}
	while not IZGOOD do
		cp = shallowcopy(rdtb(itemsPool))
		table.insert(items, cp)
		currentVal = currentVal + items[#items].val
		print(currentVal, cp.val, human.totVal, cp.str)
		if #items > 12 then
			items = {}
		else
			if currentVal >= human.totVal then
				if #items <= 3 then
					items = {}
					currentVal = 0
					print()
				else
					IZGOOD = true
				end
			end
		end
	end
	return items
end


return Item
