local Wish = {}

function grantWish()
	resources[cHuman.wish[3]] = resources[cHuman.wish[3]] - cHuman.wish[2]
end


return Wish