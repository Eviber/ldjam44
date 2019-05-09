local gCredits = {}
local backBtn

local function Isin(x,y,x2,y2)
	return x > x2 and x < x2 + 40 and y > y2 and y < y2 + 40
end

local function hover()
	local x,y = TLfres.getMousePosition(W,H)
	return	Isin(x,y,560,458) == true or
			Isin(x,y,619,458) == true or
			Isin(x,y,506,504) == true or
			Isin(x,y,560,504) == true or
			Isin(x,y,506,552) == true or
			Isin(x,y,506,762) == true
end

function gCredits:init()
	backBtn = Button:create(230, 870, 97, 90, btn.noclick, btn.click, function() Gamestate.switch(gMenu) end)
	ln1 = Button:create(560, 458, 40, 40, nil, nil, function() love.system.openURL("https://github.com/eclahn") end)
	ln2 = Button:create(619, 458, 40, 40, nil, nil, function() love.system.openURL("https://twitter.com/EHaamu") end)
	ln3 = Button:create(506, 504, 40, 40, nil, nil, function() love.system.openURL("https://github.com/eviber") end)
	ln4 = Button:create(560, 504, 40, 40, nil, nil, function() love.system.openURL("https://twitter.com/youvaaaaa") end)
	ln5 = Button:create(506, 552, 40, 40, nil, nil, function() love.system.openURL("https://github.com/yarypert") end)
	ln6 = Button:create(506, 762, 40, 40, nil, nil, function() love.system.openURL("https://www.instagram.com/boudoumgredon/") end)
end

function gCredits:enter()
end

function gCredits:update(dt)
	if hover() then
		love.mouse.setCursor(za_hand)
	else
		love.mouse.setCursor(cursor)
	end
end

function gCredits:keypressed(key, scancode, isrepeat)
	if scancode == 'escape' then
		Gamestate.switch(gMenu)
	end
end

function gCredits:mousereleased(x, y, click_type)
	backBtn:onrelease()
	ln1:onrelease()
	ln2:onrelease()
	ln3:onrelease()
	ln4:onrelease()
	ln5:onrelease()
	ln6:onrelease()
end   

function gCredits:mousepressed(x, y, click_type)
	backBtn:onpress()
	ln1:onpress()
	ln2:onpress()
	ln3:onpress()
	ln4:onpress()
	ln5:onpress()
	ln6:onpress()
end

function gCredits:draw()
	TLfres.beginRendering(W, H)
	love.graphics.draw(CreditsImg, 0, 0)
	backBtn:draw()
	TLfres.endRendering({0,0,0,0})
end

return gCredits
