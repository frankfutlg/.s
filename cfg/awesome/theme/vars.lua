local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = gfs.get_configuration_dir().."theme/"

return { 
	color = {
		-- Special
		bg		= "#fbfff2",
		fg		= "#0e1400",

		white200	= "#f0f5e6",
		white400	= "#e5ebda",
		white600	= "#dae0ce",
		white800	= "#cfd6c3",
		white1000	= "#c5ccb8",
		white1200	= "#bac2ac",
		white1400	= "#b0b8a2",

		black200	= "#111a0d",
		black400	= "#161a0d",
		black600	= "#20241b",
		black800	= "#2b2e28",
			
		-- Colors
		red200		= "#c28667",
		red400		= "#eba886",
		red600		= "#f7c9b2",

		green200	= "#9fbd4d",
		green400	= "#c6e670",
		green600	= "#dbf29b",

		yellow200	= "#c0c24f",
		yellow400	= "#eaeb73",
		yellow600	= "#f7f79e",

		blue200		= "#999bbf",
		blue400		= "#c3c3e8",
		blue600		= "#dadaf5",

       		magenta200	= "#bd93a4",
		magenta400	= "#e6bece",
		magenta600	= "#f2d5e1",

		cyan200		= "#6ea5cc",
		cyan400		= "#98cef5",
		cyan600		= "#c4e6ff",
	},

	var = {
		font = "cherry 9",
		wall = gears.surface.load_uncached(themes_path.."assets/wall.png")
	},
}
