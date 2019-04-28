local utils = {}

function utils:hasValue(seek, tab)
	for _, val in ipairs(tab) do
		if val == seek then
			return true
		end
	end
	return false
end


return utils