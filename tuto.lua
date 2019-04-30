local Class = require"button"
local button = Button:create(1600, 960, 97, 90)
local skip = love.graphics.newImage(button.img1)


local gTuto = {}
local var_s = 1
local slide = 
{
	s1 = love.graphics.newImage("assets/img/slide1.jpg"),
	s2 = love.graphics.newImage("assets/img/slide2.jpg"),
	s3 = love.graphics.newImage("assets/img/slide3.jpg"),
	s4 = love.graphics.newImage("assets/img/slide4.jpg"),
	s5 = love.graphics.newImage("assets/img/slide5.jpg"),
	s6 = love.graphics.newImage("assets/img/slide6.jpg"),
	s7 = love.graphics.newImage("assets/img/slide7.jpg"),
	s8 = love.graphics.newImage("assets/img/slide8.jpg"),
	s9 = love.graphics.newImage("assets/img/slide9.jpg"),
	s10 = love.graphics.newImage("assets/img/slide10.jpg"),
	s11 = love.graphics.newImage("assets/img/slide11.jpg"),
	s12 = love.graphics.newImage("assets/img/slide12.jpg"),
	s13 = love.graphics.newImage("assets/img/slide13.jpg"),
}
tuto_skip = love.graphics.newImage("assets/img/skip.png")


function gTuto:init()
end

function gTuto:enter()
end

function gTuto:update(dt)
end

function sliders()
	if var_s == 1 then
		love.graphics.draw(slide.s1,0,0)
	elseif var_s == 2 then
		love.graphics.draw(slide.s2,0,0)
	elseif var_s == 3 then
		love.graphics.draw(slide.s3,0,0)
	elseif var_s == 4 then
		love.graphics.draw(slide.s4,0,0)
	elseif var_s == 5 then
		love.graphics.draw(slide.s5,0,0)
	elseif var_s == 6 then
		love.graphics.draw(slide.s6,0,0)
	elseif var_s == 7 then
		love.graphics.draw(slide.s7,0,0)
	elseif var_s == 8 then
		love.graphics.draw(slide.s8,0,0)
	elseif var_s == 9 then
		love.graphics.draw(slide.s9,0,0)
	elseif var_s == 10 then
		love.graphics.draw(slide.s10,0,0)
	elseif var_s == 11 then
		love.graphics.draw(slide.s11,0,0)
	elseif var_s == 12 then
		love.graphics.draw(slide.s12,0,0)
	elseif var_s == 13 then
		love.graphics.draw(slide.s13,0,0)
	elseif var_s == 14 then 
		tuto_on = false
		Gamestate.switch(gGame)
	end
end

function gTuto:draw()
	love.graphics.setColor(1,1,1,1)
	TLfres.beginRendering(1920, 1080)
	sliders()
	love.graphics.draw(tuto_skip,0 ,0)
	love.graphics.draw(skip, button.x, button.y)
	TLfres.endRendering({0,0,0,0})
end

function gTuto:mousepressed(x, y, click_type)
	x,y = TLfres.getMousePosition(1920,1080)
	if button:isclicked(x,y) == true then
		skip = love.graphics.newImage(button.img2)
	end
end

function gTuto:mousereleased(x, y, click_type)
	x,y = TLfres.getMousePosition(1920,1080)
	if button:isclicked(x,y) == true then
		skip = love.graphics.newImage(button.img1)
		tuto_on = false
		Gamestate.switch(gGame)
	else
		var_s = var_s + 1    
	end
end   

function gTuto:keypressed(key, scancode, isrepeat)
	if scancode == 'space' then
		var_s = var_s + 1
	end
end

return gTuto
