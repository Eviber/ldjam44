local lg = love.graphics

local vfx = {}

function vfx.load()

	fire = lg.newParticleSystem(love.graphics.newImage("assets/img/fire.png"), 5000)
	fire:setEmissionRate(2100)
	fire:setParticleLifetime(0.25)
	fire:setEmissionArea("ellipse", 110, 80)
	fire:setEmitterLifetime(0.25)

	fire:setSpeed(2000)
	fire:setRadialAcceleration(0)
	fire:setLinearDamping(0)

	fire:setDirection(-math.pi/2)
	fire:setSpread(0)

	fire:setSizes(1.33, 2.5, 0.1)
	fire:setSizeVariation(0)
	fire:setColors(255/255,255/255,156/255,1,
				   241/255,  0/255, 21/255,1,
				    68/255, 24/255,  0/255,1)

	fire:setPosition(1110, 950)
	fire:stop()

	cigar = lg.newParticleSystem(love.graphics.newImage("assets/vfx/smoke.png"))
	cigar:setEmissionRate(20)
	cigar:setParticleLifetime(7)
	cigarX, cigarY, cigarW, cigarH = 1110,840,30,15
	cigar:setEmissionArea("ellipse", cigarW, cigarH)

	cigar:setSpeed(100)
	cigar:setRadialAcceleration(0)
	cigar:setLinearDamping(0)

	cigar:setDirection(-math.pi/2)
	cigar:setSpread(math.pi/16)

	cigar:setSizes(0, 1)
	cigar:setSizeVariation(0.2)
	cigar:setColors(200/255,200/255,200/255,0.05,
					200/255,200/255,200/255,0.05,
					200/255,200/255,200/255,0.05,
					200/255,200/255,200/255,0.05,
					200/255,200/255,200/255,0.05,
					200/255,200/255,200/255,0.02,
					255/255,255/255,255/255,0)
	cigar:setRotation(-math.pi, math.pi)
	cigar:setSpin(-math.pi/8, math.pi/8)

	cigar:setPosition(1100,840)
	cigar:stop()

	pcig = cigar:clone()
	pcig:setSpeed(50)
	pcig:setPosition(1420,580)
	pcig:setSizes(0, 0.2)
	pcig:setEmissionArea("none", 0, 0)
	pcig:setColors(200/255,200/255,200/255,0.1,
					200/255,200/255,200/255,0.1,
					200/255,200/255,200/255,0.1,
					200/255,200/255,200/255,0.1,
					200/255,200/255,200/255,0.1,
					200/255,200/255,200/255,0.05,
					255/255,255/255,255/255,0)

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
