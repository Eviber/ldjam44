Gamestate = require "hump.gamestate"
world = require "world"
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
	W, H = love.window.getMode()

	loadassets()

	Gamestate.switch(gMenu)
end
