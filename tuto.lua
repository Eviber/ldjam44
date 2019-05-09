local gTuto = {}

local btnSkip
local var_s = 0
local slide

local function leave()
	slide = nil
	tuto_skip = nil
	tuto_on = false
	Gamestate.switch(gGame)
end

local function nextSlide()
	var_s = var_s + 1
	if var_s < 14 then
		slide = love.graphics.newImage("assets/img/slide" .. tostring(var_s) .. ".jpg")
	else
		leave()
	end
end

function gTuto:init()
	tuto_skip = love.graphics.newImage("assets/img/skip.png")
	btnSkip = Button:create(1600, 960, 97, 90, btn.noclick, btn.click, leave)
	nextSlide()
end

function gTuto:draw()
	TLfres.beginRendering(W, H)
	love.graphics.setColor(1,1,1,1)
	love.graphics.draw(slide,0,0)
	love.graphics.draw(tuto_skip,1712,998)
	btnSkip:draw()
	TLfres.endRendering({0,0,0,0})
end

function gTuto:mousepressed(x, y, click_type)
	btnSkip:onpress()
end

function gTuto:mousereleased(x, y, click_type)
	btnSkip:onrelease()
	if not btnSkip:ishover() then
		nextSlide()
	end
end   

function gTuto:keypressed(key, scancode, isrepeat)
	if scancode == 'space' then
		nextSlide()
	end
end

return gTuto
