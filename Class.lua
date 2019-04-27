Button = { x, y, w = 300, h = 100, f}

Button.__index = Button

function Button:create(x, y, w, h, f)
  local btn= {}
  setmetatable(btn,Button)
  btn.x = x
  btn.y = y
  btn.w = w
  btn.h = h
  btn.clicked = 0
  btn.f = f
  return btn
end

function Button:isclicked(x,y)
  if x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h then
    if self.f then
      f()
    end
    return true
  else
    return false
  end
end