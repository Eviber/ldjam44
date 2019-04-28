Gamestate = require "hump.gamestate"
TLfres = require "tlfres"

sfx = require "sfx"
vfx = require "vfx"

gGame = require "game"
gMenu = require "menu"
gCredits = require "credits"
gPause = require "pause"

lg = love.graphics
isDown = love.keyboard.isDown
rd = math.random

function loadassets()
	imgs = {
		--img      = lg.newImage("path/to/img"),
	}

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
