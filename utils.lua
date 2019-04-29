local utils = {}

function utils:hasValue(seek, tab)
	for _, val in ipairs(tab) do
		if val == seek then
			return true
		end
	end
	return false
end

function rdtb(tbl)
	return (tbl[rd(#tbl)])
end


return utils