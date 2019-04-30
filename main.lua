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
	GO_pos = lg.newImage("/assets/img/game_over_pos.png"),
	GO_rel = lg.newImage("/assets/img/game_over_rel.png"),
	GO_ego = lg.newImage("/assets/img/game_over_ego.png"),
	WIN_pos = lg.newImage("/assets/img/win_pos.png"),
	WIN_rel = lg.newImage("/assets/img/win_rel.png"),
	WIN_ego = lg.newImage("/assets/img/win_ego.png"),
  }

	stamps = {
		accepted = lg.newImage("assets/img/approved.png"),
		denied = lg.newImage("assets/img/denied.png"),
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
