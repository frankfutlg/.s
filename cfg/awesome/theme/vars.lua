local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = gfs.get_configuration_dir().."theme/"

return { 
	color = {
		-- Special
		bg		= "#f2f7fa",
		fg		= "#0f1417",

		bg_1		= "#e9eff2",
		bg_2		= "#dfe6eb",
		bg_3		= "#dadfe3",

		fg_1		= "#141b1f",
		fg_2		= "#43494d",
			
		-- Colors
		red		= "#bf4539",
		green		= "#07ab30",
		yellow		= "#d99a36",
		blue		= "#5a80cc",
		magenta		= "#8760bd",
		cyan		= "#4fb8c2"
	},

	var = {
		font = "Cozette 11",
		wall = gears.surface.load_uncached(themes_path.."assets/wall.jpg")
	},
}
