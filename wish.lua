local Wish = {}

function Wish:grantWish()
	local offer = 0
	local taken = {}
	local a = 0
	for i, item in ipairs(cHuman.items) do
		if item.checked == true then
			a = a + 1
			offer = offer + item.val
			taken[a] = item
		end
	end

	if offer <= cHuman.wish[2] * cHuman.ratio then
		for i = 1, #taken do
			resources[taken[i].cat] = resources[taken[i].cat] + taken[i].val
		end
		resources[cHuman.wish[3]] = resources[cHuman.wish[3]] - cHuman.wish[2]
		return true
	end
	return false
end


return Wish
