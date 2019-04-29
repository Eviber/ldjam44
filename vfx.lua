local lg = love.graphics

local vfx = {}

function vfx.load()

	fire = lg.newParticleSystem(love.graphics.newImage("/assets/img/fire.png"))
	fire:setParticleLifetime(0.6)
	--fire:setSizes(2,2,3,3)
  --fire:setSpread(math.pi/4)
  fire:setSpeed(800,800)
  --fire:setRadialAcceleration(25)
  fire:setSizeVariation(1)
	fire:setPosition(1110, 960)
  fire:setEmissionArea("ellipse", 110, 80)
  --fire:setEmitterLifetime(1.5)
  fire:setEmissionRate(1000)
  fire:setDirection(-math.pi/2)
  fire:stop()
--[[
	void = lg.newParticleSystem(love.graphics.newImage('pixel.png'))
	void:setParticleLifetime(2)
	void:setSizes(tileDim/2)
	void:setLinearAcceleration(tileDim * 10/8, tileDim * 10/8, -tileDim * 10/8, -tileDim * 10/8)
	void:setPosition(W/2, H/2)
	void:setEmissionArea("normal", W/2, H/2)
	void:setEmissionRate(150)

	blur = lg.newParticleSystem(love.graphics.newImage('pixel.png'))
	blur:setParticleLifetime(2)
	blur:setSizes(0, tileDim)
	blur:setPosition(W/2, H/2)
	blur:setRadialAcceleration(0, tileDim * 70)
	blur:setLinearDamping(1)
	blur:setEmissionArea("borderellipse", 1, 1)
	blur:setEmissionRate(500)
	blur:stop()
]]
end



--[[
	smoke:setEmissionRate(10 * speed)
	screen:update(dt)
	smoke:update(dt)
	void:update(dt)
--	blur:setParticleLifetime(1.75 * transiRad / diag)
--	blur:setEmissionArea("borderellipse", transiRad, transiRad)
	blur:update(dt)
	do
		local i = transition and 0 or 2
		local r, g, b = getColor(colorTab[(iter.id + i) % 3 + 1], False)
		void:setColors(r, g, b, 1, r, g, b, 0)
		smoke:setColors(r, g, b, 1, r, g, b, 0)
		r, g, b = getColor(colorTab[(iter.id + i + 1) % 3 + 1], False)
		blur:setColors(r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 1, r, g, b, 0)
	end
	for _, psys in pairs(p) do
		psys:update(dt)
	end
	smoke:moveTo(Player.x, Player.y)
end
]]

function vfx.update(dt)
	fire:update(dt)
end

function vfx.draw()
	lg.setColor(1,1,1,1)
	lg.draw(fire)
end

return vfx
