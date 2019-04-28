local Human = {}
require "pools"

function Human:new_human()
	human = {}
	human.wish = wishesPool[math.random(#wishesPool)]
	human.appearance = {}
	human.toRemove = false
	return human
end


return Human