local Gamestate = require "hump.gamestate"
world = require "world"

lg = love.graphics
isDown = love.keyboard.isDown


function love.load()
	gameWorld = world:create()
end

function love.update(dt)
	world:update(dt)
end