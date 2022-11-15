local gfs = require("gears.filesystem")
local config_dir = gfs.get_configuration_dir()
local script_dir = config_dir .. "scripts/"

return {
	--- default apps
	app = {
		term = "st",
		browser = "firefox",
		editor = "vim",
		launcher = "dmenu_run",
	},

	--- scripts
	script = {
		shot_full = script_dir .. "shot.awm -f",
		shot_area = script_dir .. "shot.awm -s",
		shot_client = script_dir .. "shot.awm -w",

		git_kcopy = script_dir.."git_kcopy.awm",
		cclear = script_dir.."clear_clipboard.awm" 
	},
}
