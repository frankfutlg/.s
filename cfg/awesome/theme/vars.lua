local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = gfs.get_configuration_dir().."theme/"

return { 
	color = {
		-- Special
		bg		= "#fbffed",
		fg		= "#101400",

		white200	= "#f0f5e1",
		white400	= "#e6ebd6",
		white600	= "#dbe0ca",
		white800	= "#d1d6bf",
		white1000	= "#c6ccb4",
		white1200	= "#bcc2a9",
		white1400	= "#b1b89e",
		white1600	= "#a7ad93",
		white1800	= "#9da389",
		white2000	= "#93997f",
		white2200	= "#898f75",
		white2400	= "#7f856b",
		white2600	= "#757a62",
		white2800	= "#6b7059",
		white3000	= "#616650",

		black200	= "#171f02",
		black400	= "#1f2904",
		black600	= "#283308",
		black800	= "#313d0c",
			
		-- Colors
		red000		= "#c47d58",
		red200		= "#c4937a",
		red400		= "#f7b999",
		red600		= "#ffcdb3",

		green000	= "#98bf1d",
		green200	= "#a9bf60",
		green400	= "#d6f279",
		green600	= "#e2fa91",

		yellow000	= "#c4be35",
		yellow200	= "#ccc96e",
		yellow400	= "#faf68e",
		yellow600	= "#fffca6",

		blue000		= "#8181c7",
		blue200		= "#a3a3bf",
		blue400		= "#d4d4fa",
		blue600		= "#e6e6ff",

		magenta000	= "#c4829b",
       		magenta200	= "#cca7b6",
		magenta400	= "#f7d5e2",
		magenta600	= "#ffe0ec",

		cyan000		= "#6ea4cc",
		cyan200		= "#a0c1d9",
		cyan400		= "#bde3ff",
		cyan600		= "#d9efff",
	},

	var = {
		font = "cherry 9",
		wall = gears.surface.load_uncached(themes_path.."assets/wall.png")
	},
}
