local gCredits = {}

function gCredits:init()
  src1 = love.audio.newSource("assets/sfx/music/lulz.wav", "static")
  src1:play()
end

function gCredits:enter()
end

function gCredits:update(dt)
end

function gCredits:keypressed(key, scancode, isrepeat)
  if scancode == 'escape' then
		love.event.quit()
	end
end

function gCredits:draw()
  TLfres.beginRendering(1920, 1080)
  love.graphics.draw(LULZ, 0, 0)
  TLfres.endRendering({0,0,0,0})
end

return gCredits
