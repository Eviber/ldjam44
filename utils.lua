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

function shallowcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end


return utils
