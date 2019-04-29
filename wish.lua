local Wish = {}

function Wish:grantWish()
	if resources[cHuman.wish[3]] >= cHuman.wish[2] then
		resources[cHuman.wish[3]] = resources[cHuman.wish[3]] - cHuman.wish[2]
		for i = 0, #cHuman.items do
			if cHuman.items[i] ~= nil and cHuman.items[i].checked then
				resources[cHuman.items[i].cat] = resources[cHuman.items[i].cat] + cHuman.items[i].val
			end
		end
		return true
	end
	return false
end


return Wish