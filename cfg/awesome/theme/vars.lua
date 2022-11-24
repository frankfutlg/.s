local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = gfs.get_configuration_dir().."theme/"

return { 
	color = {
		-- Special
		bg		= "#00040a",
		fg		= "#e1e9f5",

		bg_1		= "#050b14",
		bg_2		= "#0f161f",
		bg_3		= "#1f2329",
		bg_4		= "#2c2f33",

		fg_1		= "#c5d1e0",
		fg_2		= "#d3ddeb",
			
		-- Colors
		red		= "#ed6c5f",
		green		= "#77ed9e",
		yellow		= "#ffa866",
		blue		= "#749dfc",
		magenta		= "#f78fe6",
		cyan		= "#68dde8"
	},

	var = {
		font = "cherry 9",
		wall = gears.surface.load_uncached(themes_path.."assets/w1.jpg")
	},
}
