local Filters = {}

function filter(entity, components)
	local pluckedEntityComponents = 0
	--local matchRequirements = true 
	for requiredComponentName, component in ipairs(components) do
		if entity.components[requiredComponentName] ~= nil then
			pluckedEntityComponents = pluckedEntityComponents + 1
		end
	end
	return (pluckedEntityComponents)
end


function requireAll(entity, requiredComponents)
	if #entity.components ~= 1 then
		filter(entity, requiredComponents)

		if pluckedEntityComponents == #requiredComponents then
			return true
		end
	end
	return false
end

function requireAny(entity, requiredComponents)
	if #entity.components ~= 1 then
		filter(entity, requiredComponents)

		if pluckedEntityComponents > 0 then
			return true
		end
	end
	return false
end

function excludeAll(entity, requiredComponents)
	if #entity.components ~= 1 then
		filter(entity, requiredComponents)

		if pluckedEntityComponents == #requiredComponents then
			return false
		else
			return true
		end
	end
	return false
end

function excludeAny(entity, requiredComponents)
	if #entity.components ~= 1 then
		filter(entity, requiredComponents)

		if pluckedEntityComponents > 0 then
			return false
		else
			return true
		end
	end
	return false
end

return Filters