require "button"

local btnPlay
local btnCred
local btnQuit

local gMenu = {}

local blinking = true
local untilblink = 0

function gMenu:init()
	tuto_on = true
	btnPlay = Button:create(1250, 150, 320, 100, btn.noclick, btn.click, function() Gamestate.switch(tuto_on and gTuto or gGame) end)
	btnCred = Button:create(1250, 350, 425, 100, btn.noclick, btn.click, function() Gamestate.switch(gCredits) end)
	btnQuit = Button:create(1250, 550, 320, 100, btn.noclick, btn.click, function() love.event.quit() end)
end

function gMenu:enter()
	resources = {relations = 1000, ego = 1000, possessions = 1000}
	cHuman = Human:create()
	fromMenu = true
	accepted = false
	denied = false
	Timer.clear()
	fire:stop()
	cigar:start()
	--print(love.timer.getTime() - startTime) -- to get launch time
end

function gMenu:leave()
end

function blink(dt)
	untilblink = untilblink - dt
	if untilblink <= 0 then
		blinking = not blinking
		local r = 1-((math.random()*2)-1)
		r = r*r
		if blinking then
			untilblink = 0.1 + r/20
		else
			untilblink = 3 + r*2
		end
	end
end

function gMenu:update(dt)
	cigar:update(dt)
	blink(dt)
end

-- first is simple translation, second is rotation, third is scaling
function drawbg()
	for i = 1, 5 do
		--love.graphics.draw(MenuImg[i], -100 + math.sin((love.timer.getTime()+i)*(6-i))*(6-i), -100 + math.sin((love.timer.getTime()-i)*(6-i))*(6-i))
		--love.graphics.draw(MenuImg[i], 225, 150, math.sin(love.timer.getTime()*(6-i)) / 50, 1, 1, 325, 250)
		love.graphics.draw(MenuImg[i], 225, 150, 0,
			1 + (math.sin(love.timer.getTime()+(6-i)/3)/(i*5)),
			1 + (math.sin(love.timer.getTime()+(6-i)/3)/(i*5)), 325, 250)
	end
	love.graphics.draw(MenuImg[6], 0, 0)
end

function gMenu:draw()
	TLfres.beginRendering(W,H)
	love.graphics.setColor(1,1,1,1)
	drawbg()
	if (blinking) then lg.draw(MenuImg.blink, 240, 173) end
	btnPlay:draw()
	btnCred:draw()
	btnQuit:draw()
	lg.draw(cigar)
	--love.graphics.setColor(0,1,0,1)
	--lg.ellipse("line", cigarX, cigarY, cigarW, cigarH)
	love.graphics.setColor(1,1,1,1)
	--lg.draw(startscreen.hand)
	TLfres.endRendering({0,0,0,0})

end

function gMenu:mousepressed(x, y, click_type)
	btnPlay:onpress()
	btnCred:onpress()
	btnQuit:onpress()
end

function gMenu:mousereleased(x, y, click_type)
	btnPlay:onrelease()
	btnCred:onrelease()
	btnQuit:onrelease()
end   

function gMenu:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		love.event.quit()
	end
end

return gMenu
