Gamestate = require "hump.gamestate"
TLfres = require "tlfres"

sfx = require "sfx"
vfx = require "vfx"
utils = require "utils"

gGame = require "game"
gMenu = require "menu"
gCredits = require "credits"
gPause = require "pause"
gTuto = require "tuto"
require "button"


lg = love.graphics
isDown = love.keyboard.isDown
rd = math.random



function loadassets()
	imgs = {
		bg_back = lg.newImage("/assets/img/bg_back.png"),
    bg_front = lg.newImage("/assets/img/bg_front.png"),
    sp_desk = lg.newImage("/assets/img/sprite_desk.png"),
    sp_pnj = lg.newImage("/assets/img/sprite_pnj.png"),
    sp_satan1 = lg.newImage("/assets/img/sprite_satan_12.png"),
    sp_satan2 = lg.newImage("/assets/img/sprite_satan_22.png"),
    sp_ground = lg.newImage("/assets/img/sprite_ground.png"),
    sp_cont = lg.newImage("/assets/img/sprite_contract.png"),
    sp_unit_b = lg.newImage("/assets/img/sprite_blue_unit.png"),
    sp_unit_g = lg.newImage("/assets/img/sprite_green_unit.png"),
    sp_unit_r = lg.newImage("/assets/img/sprite_red_unit.png"),
    sp_penta = lg.newImage("/assets/img/sprite_penta.png"),
    sp_window = lg.newImage("/assets/img/sprite_window.png"),
    bop = lg.newImage("/assets/img/bop.png"),
    sp_tick1 = lg.newImage("/assets/img/sprite_tickbox_empty.png"),
    sp_tick2 = lg.newImage("/assets/img/sprite_tickbox.png"),
    sp_vial_r = lg.newImage("/assets/img/sprite_vial_r.png"),
    sp_vial_g = lg.newImage("/assets/img/sprite_vial_g.png"),
    sp_vial_b = lg.newImage("/assets/img/sprite_vial_b.png"),
    sp_symb_b = lg.newImage("/assets/img/sprite_symbol_b.png"),
    sp_symb_g = lg.newImage("/assets/img/sprite_symbol_g.png"),
    sp_symb_r = lg.newImage("/assets/img/sprite_symbol_r.png"),
    sp_photo = lg.newImage("/assets/img/sprite_photo.png"),
  }
  
	fonts = {
		wishFont = lg.newFont("/assets/COPRGTB.TTF", 28),
		itemFont = lg.newFont("/assets/COPRGTB.TTF", 22),
	}

	con = {
		tick  = lg.newImage("assets/img/sprite_tickbox_empty.png"),
	}
	fiole = {
		possessions = lg.newImage("assets/img/sprite_vial_b.png"),
		relations   = lg.newImage("assets/img/sprite_vial_r.png"),
		ego         = lg.newImage("assets/img/sprite_vial_g.png"),
	}
	clip = {
		g = lg.newImage("/assets/img/sprite_tromb_g.png"),
		y = lg.newImage("/assets/img/sprite_tromb_y.png"),
		r = lg.newImage("/assets/img/sprite_tromb_r.png"),
	}

	cursor = love.mouse.newCursor("assets/img/cursor.png", 3, 2)
	za_hand = love.mouse.getSystemCursor("hand")
	sfx.load()
	vfx.load()
end

function love.load()
	math.randomseed(os.time())
	love.keyboard.setKeyRepeat(false)
	Gamestate.registerEvents()
	W, H = 1920, 1080

	loadassets()
	love.mouse.setCursor(cursor)

	Gamestate.switch(gMenu)
end
