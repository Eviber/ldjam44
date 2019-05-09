Gamestate = require "hump.gamestate"
TLfres = require "tlfres"
Timer = require "hump.timer"


sfx = require "sfx"
vfx = require "vfx"
utils = require "utils"

gGame = require "game"
gMenu = require "menu"
gOver = require "game_over"
gCredits = require "credits"
gPause = require "pause"
gTuto = require "tuto"
require "button"


lg = love.graphics
isDown = love.keyboard.isDown
rd = math.random

max_resources = 3000
gameover_state = 0


function loadassets()
	--startscreen = {
		--hand = lg.newImage("assets/img/hand.png"), -- 624, 309
	--}
	imgs = {
		bg_back   = lg.newImage("assets/img/bg_back.png"),
		background= lg.newImage("assets/img/background.png"),
		--[[
		bg_front  = lg.newImage("assets/img/bg_front.png"),
		sp_desk   = lg.newImage("assets/img/sprite_desk.png"),
		deskvials = lg.newImage("assets/img/sprite_vial_desk.png"),
		sp_satan1 = lg.newImage("assets/img/sprite_satan_12.png"),
		sp_satan2 = lg.newImage("assets/img/sprite_satan_22.png"),
		sp_ground = lg.newImage("assets/img/sprite_ground.png"),
		sp_penta  = lg.newImage("assets/img/sprite_penta.png"),
		sp_window = lg.newImage("assets/img/sprite_window.png"),
		sp_chair  = lg.newImage("assets/img/sprite_chair.png"),
		]]
		sp_pnj    = lg.newImage("assets/img/sprite_pnj.png"),
		sp_cont   = lg.newImage("assets/img/sprite_contract.png"),
		sp_unit_b = lg.newImage("assets/img/sprite_blue_unit.png"),
		sp_unit_g = lg.newImage("assets/img/sprite_green_unit.png"),
		sp_unit_r = lg.newImage("assets/img/sprite_red_unit.png"),
		bop       = lg.newImage("assets/img/bop.png"),
	}

	CreditsImg = love.graphics.newImage("assets/img/Credits.jpg")
	MenuImg = love.graphics.newImage("assets/img/bg_menu.png")

	symbol = {
		possessions = lg.newImage("assets/img/sprite_symbol_b.png"),
		ego = lg.newImage("assets/img/sprite_symbol_g.png"),
		relations = lg.newImage("assets/img/sprite_symbol_r.png"),
	}

	stamps = {
		accepted = lg.newImage("assets/img/approved.png"),
		denied = lg.newImage("assets/img/denied.png"),
	}

	fonts = {
		wishFont = lg.newFont("assets/COPRGTB.TTF", 28),
		itemFont = lg.newFont("assets/COPRGTB.TTF", 22),
		spaceFont = lg.newFont("assets/COPRGTB.TTF", 20),
	}

	btn = {
		noclick = lg.newImage("assets/img/Bouton.png"),
		click = lg.newImage("assets/img/Bouton2.png"),
		untick  = lg.newImage("assets/img/sprite_tickbox_empty.png"),
		tick = lg.newImage("assets/img/sprite_tickbox.png"),
	}
	fiole = {
		possessions = lg.newImage("assets/img/sprite_vial_b.png"),
		relations   = lg.newImage("assets/img/sprite_vial_r.png"),
		ego         = lg.newImage("assets/img/sprite_vial_g.png"),
	}
	clip = {
		g = lg.newImage("assets/img/sprite_tromb_g.png"),
		y = lg.newImage("assets/img/sprite_tromb_y.png"),
		r = lg.newImage("assets/img/sprite_tromb_r.png"),
	}

	cursor = love.mouse.newCursor("assets/img/cursor.png", 3, 2)
	za_hand = love.mouse.getSystemCursor("hand")
	sfx.load()
	vfx.load()
end

function love.load()
	startTime = love.timer.getTime()
	math.randomseed(os.time())
	love.keyboard.setKeyRepeat(false)
	Gamestate.registerEvents()
	W, H = 1920, 1080

	loadassets()
	love.mouse.setCursor(cursor)

	Gamestate.switch(gMenu)
end
