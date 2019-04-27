local GameSystems = {}

local filters = require "filters"

--[[
Un système doit contenir impérativement:
- une fonction "self.filter" prenant en argument une entity et appelant une des fonctions du fichier filters.lua
- une fonction "self.update" prenant en argument dt et une entity et faisant ce que le système est censé faire
- une variable "self.status" pouvant valoir "running" ou "paused"
]]



return GameSystems