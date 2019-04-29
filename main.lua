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
    sp_cont_s = lg.newImage("/assets/img/sprite_contract_shadow.png"),
    sp_unit_b = lg.newImage("/assets/img/sprite_blue_unit.png"),
    sp_unit_g = lg.newImage("/assets/img/sprite_green_unit.png"),
    sp_unit_r = lg.newImage("/assets/img/sprite_red_unit.png"),
    sp_penta = lg.newImage("/assets/img/sprite_penta.png"),
    sp_window = lg.newImage("/assets/img/sprite_window.png"),
    bop = lg.newImage("/assets/img/bop.png"),
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
