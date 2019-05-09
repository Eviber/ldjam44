Button = { x, y, w, h, img, f}

Button.__index = Button

function Button:create(x, y, w, h, img, imgclicked, f, tick, offx, offy)
	local btn= {}
	setmetatable(btn,Button)
	btn.x = x
	btn.y = y
	btn.w = w
	btn.h = h
	btn.clicked = false
	btn.img = img
	btn.imgclicked = imgclicked
	btn.f = f
	btn.tick = tick
	btn.offsetx = offx
	btn.offsety = offy
	return btn
end

function Button:ishover()
	local x,y = TLfres.getMousePosition(W,H)
	x = x - (self.offsetx or 0)
	y = y - (self.offsety or 0)
	return x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h
end

function Button:onpress()
	if self:ishover() then
		if self.tick then
			self.clicked = not self.clicked
			if self.f then
				self:f()
			end
		else
			self.clicked = true
		end
		return true
	end
end

function Button:onrelease()
	if self.clicked and self:ishover() and self.f then
		if self.f then
			self:f()
		end
	end
	if not self.tick then
		self.clicked = false
	end
end

function Button:draw()
	if self.imgclicked and self.clicked and (self:ishover() or self.tick) then
		lg.draw(self.imgclicked, self.x, self.y)
	elseif self.img then
		lg.draw(self.img, self.x, self.y)
	end
end
