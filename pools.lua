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
        {"I want to be elected\npresident.", wish.v2, "possessions"},
        {"I want to win the lottery.", wish.v3, "possessions"},
        {"I want a private island.", wish.v4, "possessions"},
        {"I want a huge mansion.", wish.v5, "possessions"},
        {"I want a pot of gold.", wish.v6, "possessions"},
        {"I want to get my dream\njob.", wish.v7, "possessions"},
        {"I want a very big car.", wish.v8, "possessions"},
        {"I want to be elected\nmayor.", wish.v9, "possessions"},
        {"I want a shrubbery.", wish.v10, "possessions"},
        {"Can i haz cheezburger?", wish.v11, "possessions"},
    },
    {
        {"I want someone to die.", wish.v1, "relations"}, --ex: i want XXX to die
        {"I want to find my\nsoulmate.", wish.v2, "relations"},
        {"I want to have kids.", wish.v3, "relations"}, --ex: i want to have kids // i want my sister to have kids
        {"I want to talk with\nsomeone who died.", wish.v4, "relations"},
        {"I want to cure someone's\ndisease.", wish.v5, "relations"},
        {"I want to be loved by\neveryone.", wish.v6, "relations"},
        {"I want us to be together\nagain.", wish.v7, "relations"},
        {"I want them to accept me\nfor who I am.", wish.v8, "relations"},
        {"I want them to break up.", wish.v9, "relations"},
        {"I want my waifu to be real.", wish.v10, "relations"},
        {"I want a pet rock.", wish.v11, "relations"},
    },
	{
		{"I wanna be the very best\nlike no one ever was.", wish.v1, "ego"},
		{"I want to be the first\nman on Mars.", wish.v2, "ego"},
		{"I want to leave a mark on\nHistory.", wish.v3, "ego"},
		{"I want to win gold at the\nOlympics.", wish.v4, "ego"},
		{"I want to become the best\npianist.", wish.v5, "ego"},
		{"I want to become the\ngreatest singer.", wish.v6, "ego"},
		{"I want to be stunning.", wish.v7, "ego"},
		{"I want to change my body.", wish.v8, "ego"},
		{"I wnat to be creud form\nmy dysxlesia.", wish.v9, "ego"},
		{"I want to win the ludum\ndare 44.", wish.v10, "ego"},
		{"I want a cucumber THIS\nbig.", wish.v11, "ego"},
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
	makeitem("Company", items.v1, "possessions"),
	makeitem("Jet", items.v2, "possessions"),
	makeitem("House", items.v3, "possessions"),
	makeitem("Car", items.v4, "possessions"),
	makeitem("Computer", items.v5, "possessions"),
	makeitem("Favorite\nunderwear", items.v6, "possessions"),

	-- relations
	makeitem("Kid", items.v1, "relations"),
	makeitem("Lover", items.v2, "relations"),
	makeitem("Friendship", items.v3, "relations"),
	makeitem("Pet", items.v4, "relations"),
	makeitem("Acquaintance", items.v5, "relations"),
	makeitem("Contact\nlist", items.v6, "relations"),

	-- ego  
	makeitem("Happiness", items.v1, "ego"),
	makeitem("Healthiness", items.v2, "ego"),
	makeitem("Cherished\nmemory", items.v3, "ego"),
	makeitem("Limb", items.v4, "ego"), 
	makeitem("A finger", items.v5, "ego"), 
	makeitem("Half an\neyebrow", items.v6, "ego"),
}
