Gamestate = require "hump.gamestate"
TLfres = require "tlfres"

sfx = require "sfx"
vfx = require "vfx"

gGame = require "game"
gMenu = require "menu"
--gCredits = require "credits"

lg = love.graphics
isDown = love.keyboard.isDown

function loadassets()
	sfx.load()
	vfx.load()
end

function love.load()
	math.randomseed(os.time())
	love.keyboard.setKeyRepeat(false)
	Gamestate.registerEvents()
	W, H = 1920, 1080

	loadassets()

	Gamestate.switch(gMenu)
end
