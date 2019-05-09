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
	startscreen = {
		hand = lg.newImage("assets/img/hand.png"),
	}
	imgs = {
		bg_back = lg.newImage("assets/img/bg_back.png"),
		bg_front = lg.newImage("assets/img/bg_front.png"),
		sp_desk = lg.newImage("assets/img/sprite_desk.png"),
		sp_pnj = lg.newImage("assets/img/sprite_pnj.png"),
		sp_satan1 = lg.newImage("assets/img/sprite_satan_12.png"),
		sp_satan2 = lg.newImage("assets/img/sprite_satan_22.png"),
		sp_ground = lg.newImage("assets/img/sprite_ground.png"),
		sp_cont = lg.newImage("assets/img/sprite_contract.png"),
		sp_unit_b = lg.newImage("assets/img/sprite_blue_unit.png"),
		sp_unit_g = lg.newImage("assets/img/sprite_green_unit.png"),
		sp_unit_r = lg.newImage("assets/img/sprite_red_unit.png"),
		sp_penta = lg.newImage("assets/img/sprite_penta.png"),
		sp_window = lg.newImage("assets/img/sprite_window.png"),
		bop = lg.newImage("assets/img/bop.png"),
		GO_pos = lg.newImage("assets/img/game_over_pos.png"),
		GO_rel = lg.newImage("assets/img/game_over_rel.png"),
		GO_ego = lg.newImage("assets/img/game_over_ego.png"),
		WIN_pos = lg.newImage("assets/img/win_pos.png"),
		WIN_rel = lg.newImage("assets/img/win_rel.png"),
		WIN_ego = lg.newImage("assets/img/win_ego.png"),
		sp_tick1 = lg.newImage("assets/img/sprite_tickbox_empty.png"),
		sp_tick2 = lg.newImage("assets/img/sprite_tickbox.png"),
		sp_vial_r = lg.newImage("assets/img/sprite_vial_r.png"),
		sp_vial_g = lg.newImage("assets/img/sprite_vial_g.png"),
		sp_vial_b = lg.newImage("assets/img/sprite_vial_b.png"),
		sp_photo = lg.newImage("assets/img/sprite_photo.png"),
		sp_chair = lg.newImage("assets/img/sprite_chair.png"),
	}

	CreditsImg = love.graphics.newImage("assets/img/Credits.jpg")
	MenuImg = love.graphics.newImage("assets/img/bg_menu.png")

	slide =
	{
		love.graphics.newImage("assets/img/slide1.jpg"),
		love.graphics.newImage("assets/img/slide2.jpg"),
		love.graphics.newImage("assets/img/slide3.jpg"),
		love.graphics.newImage("assets/img/slide4.jpg"),
		love.graphics.newImage("assets/img/slide5.jpg"),
		love.graphics.newImage("assets/img/slide6.jpg"),
		love.graphics.newImage("assets/img/slide7.jpg"),
		love.graphics.newImage("assets/img/slide8.jpg"),
		love.graphics.newImage("assets/img/slide9.jpg"),
		love.graphics.newImage("assets/img/slide10.jpg"),
		love.graphics.newImage("assets/img/slide11.jpg"),
		love.graphics.newImage("assets/img/slide12.jpg"),
		love.graphics.newImage("assets/img/slide13.jpg"),
	}
	tuto_skip = love.graphics.newImage("assets/img/skip.png")
	symbol ={
		pos = lg.newImage("/assets/img/sprite_symbol_b.png"),
		ego = lg.newImage("/assets/img/sprite_symbol_g.png"),
		rel = lg.newImage("/assets/img/sprite_symbol_r.png"),
	}

	stamps = {
		accepted = lg.newImage("assets/img/approved.png"),
		denied = lg.newImage("assets/img/denied.png"),
	}

	fonts = {
		wishFont = lg.newFont("/assets/COPRGTB.TTF", 28),
		itemFont = lg.newFont("/assets/COPRGTB.TTF", 22),
		spaceFont = lg.newFont("/assets/COPRGTB.TTF", 20),
	}

	btn = {
		noclick = lg.newImage("assets/img/Bouton.png"),
		click = lg.newImage("assets/img/Bouton2.png"),
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
