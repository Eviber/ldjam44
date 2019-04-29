local wish = {
	v1 = 500,
	v2 = 350,
	v3 = 300,
	v4 = 250,
	v5 = 200,
	v6 = 200,
	v7 = 150,
	v8 = 100,
	v9 = 100,
	v10 = 50,
	v11 = 25,
}

local items = {
	v1 = 250,
	v2 = 200,
	v3 = 150,
	v4 = 100,
	v5 = 50,
	v6 = 25,
}

wishesPool = 
{
	{
		{"I want to be Bill Gates rich.", wish.v1 , "possessions"}, --ex: i want XXX Dollars
		{"I want to win the lottery.", wish.v2, "possessions"},
		{"I want a private island", wish.v3, "possessions"},
		{"I want to be elected president.", wish.v4, "possessions"},
		{"I want a huge mansion.", wish.v5, "possessions"},
		{"I want a pot of gold.", wish.v6, "possessions"},
		{"I want to get my dream job.", wish.v7, "possessions"},
		{"I want a very big car.", wish.v8, "possessions"},
		{"I want to be elected mayor.", wish.v9, "possessions"},
		{"I want a shrubbery.", wish.v10, "possessions"},
		{"Can i haz cheezburger?", wish.v11, "possessions"},
	},
	{
		{"I want someone to die.", wish.v1, "relations"}, --ex: i want XXX to die
		{"I want to find my soulmate.", wish.v2, "relations"},
		{"I want to have kids.", wish.v3, "relations"}, --ex: i want to have kids // i want my sister to have kids
		{"I want to talk with someone who died.", wish.v4, "relations"},
		{"I want to cure someone's disease.", wish.v5, "relations"},
		{"I want to be loved by everyone.", wish.v6, "relations"},
		{"I want us to be together again.", wish.v7, "relations"},
		{"I want them to break up.", wish.v8, "relations"},
		{"I want them to accept me for who I am.", wish.v9, "relations"},
		{"I want my waifu to be real.", wish.v10, "relations"},
		{"I want a pet rock.", wish.v11, "relations"},

	},
	{
		{"I wanna be the very best like no one ever was.", wish.v1, "ego"},
		{"I want to be the first man on Mars.", wish.v2, "ego"},
		{"I want to leave a mark on History.", wish.v3, "ego"},
		{"I want to win gold at the Olympics.", wish.v4, "ego"},
		{"I want to become the best pianist", wish.v5, "ego"},
		{"I want to become the greatest singer", wish.v6, "ego"},
		{"I want to be stunning.", wish.v7, "ego"},
		{"I want to change my body.", wish.v8, "ego"},
		{"I wnat to be creud form my dysxlesia.", wish.v9, "ego"},
		{"I want to win the ludum dare 44.", wish.v10, "ego"},
		{"I want a cucumber THIS big.", wish.v11, "ego"},
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
	makeitem("Private island", items.v1, "possessions"),
	makeitem("Company", items.v2, "possessions"),
	makeitem("House", items.v3, "possessions"),
	makeitem("Car", items.v4, "possessions"),
	makeitem("Computer", items.v5, "possessions"),
	makeitem("Vape", items.v6, "possessions"),

	-- relations
	makeitem("Kids", items.v1, "relations"),
	makeitem("Lover", items.v2, "relations"),
	makeitem("Friends", items.v3, "relations"),
	makeitem("Parent", items.v4, "relations"),
	makeitem("Pet", items.v5, "relations"),
	makeitem("Coworker", items.v6, "relations"),

	-- ego  
	makeitem("Happiness", items.v1, "ego"),
	makeitem("Healthiness", items.v2, "ego"),
	makeitem("Cherished memory", items.v3, "ego"),
	makeitem("Limb", items.v4, "ego"), 
	makeitem("A finger", items.v5, "ego"), 
	makeitem("Half an eyebrow", items.v6, "ego"),
}
