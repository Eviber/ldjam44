wishesPool = 
{
    {
        {"Dollars", 5, "possessions"}, --ex: i want XXX Dollars
        {"to win the lottery", 5, "possessions"},
        {"to get my dream job", 5, "possessions"},
        {"to be elected mayor", 5, "possessions"},
        {"to be elected president", 5, "possessions"},
    },
    {
        {"to die", 5, "relations"}, --ex: i want XXX to die
        {"to find a loving wife", 5, "relations"},
        {"to find a loving husband", 5, "relations"},
        {"to have kids", 5, "relations"}, --ex: i want to have kids // i want my sister to have kids
    },
    {
        {"to become the best pianist", 5, "ego"},
    },
}

--id = 0

local function makeitem(str, val, cat)
	--id = id + 1
	return ({--[[id=id, ]]str=str, val=val, cat=cat})
end

itemsPool =
{
    -- possessions
	makeitem("house", 5, "possessions"),
	makeitem("car", 5, "possessions"),
	makeitem("rich", 5, "possessions"),
    
	-- relations
	makeitem("lover", 5, "relations"),
	makeitem("kids", 5, "relations"),
	makeitem("dog", 5, "relations"),
	makeitem("cat", 5, "relations"),
    
	-- ego
	makeitem("boss", 5, "ego"), --ex : patron de sa boite
	makeitem("celebrity", 5, "ego"),
}
