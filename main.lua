local Gamestate = require "hump.gamestate"
world = require "world"

lg = love.graphics
isDown = love.keyboard.isDown


love.load()
	gameWorld = world.create()
end