local World = {
	allComponents = {},
	allEntities = {},
	allSystems = {}
}

local gameSys = require "gameSystems"

function World:create(type)
	if type == "game" then
		self.allComponents = require "gameComponents"
		self.allSystems = require "gameSystems"
	end
	
end


function World:newEntity(components)
	local newEntity = {
        components = {}
    }

    if components ~= nil then
        -- Allows the passing of either a string or another table
        for componentName, component in pairs(components) do
			newEntity.components[componentName] = true
            --[[if type(componentName) == "string" and type(component) == "table" then
                newEntity.components[componentName] = component
            else
                newEntity.components[component] = {}
            end]]
        end
    end

    self.allEntities[#self.allEntities + 1] = newEntity
end


function World:newSystem(system)
	--system should be a string
	self.allSystems[#self.allSystems + 1] = system
end


function World:update(dt)
	if #self.allSystems ~= 0 then
		for _, system in ipairs(self.allSystems) do
			if system.status == running then
				for i, entity in ipairs(self.allEntities) do
					if system.filter(entity) == true then
						system.update(entity, dt)
					end
				end
			end
		end
	end
	
end

return World