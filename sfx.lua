local sfx = {}

function sfx.load()
	sfx.bop = love.audio.newSource("assets/sfx/bop.wav", "static")
	music = love.audio.newSource("assets/sfx/music/music.mp3", "stream")
	music:setLooping(true)
	music:play()
	--[[
	sfx.shaman = {}
	sfx.shaman.up = love.audio.newSource("assets/audio/Shaman/shaman_up.wav", "static")
	sfx.shaman.down = love.audio.newSource("assets/audio/Shaman/shaman_down.wav", "static")
	sfx.shaman.left = love.audio.newSource("assets/audio/Shaman/shaman_left.wav", "static")
	sfx.shaman.right = love.audio.newSource("assets/audio/Shaman/shaman_right.wav", "static")
	sfx.shaman.hm = love.audio.newSource("assets/audio/Shaman/hm.wav", "static")

	sfx.kill = {}
	for i = 1, 8 do
	sfx.kill[i] = love.audio.newSource("assets/audio/Kill/kill-0" .. tostring(i) .. ".wav", "static")
	end	
	]]
end

function sfx.update()
end

return sfx
