Button = { x, y, w, h, img1, img2 ,f}

Button.__index = Button

function Button:create(x, y, w, h, f)
  local btn= {}
  setmetatable(btn,Button)
  btn.x = x
  btn.y = y
  btn.w = w
  btn.h = h
  btn.clicked = 0
  btn.img1 = "/assets/img/Bouton.png"
  btn.img2 = "/assets/img/Bouton2.png"
  btn.imgN = "/assets/img/NewGame.png"
  btn.imgC = "/assets/img/Credits.png"
  btn.imgQ = "/assets/img/Quit.png"
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
