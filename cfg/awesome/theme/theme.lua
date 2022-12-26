local gears = require("gears")
local gfs = require("gears.filesystem")
local icons_path = gfs.get_configuration_dir().."theme/assets/icons/"
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local def = require("theme.vars")
local recolor = gears.color.recolor_image
local loads = gears.surface.load_uncached

local theme = {}

	-- Theme variables
	theme.font = def.var.font
	theme.wallpaper = def.var.wall

	theme.bg = def.color.bg
	theme.white200 = def.color.white200
	theme.white400 = def.color.white400
	theme.white600 = def.color.white600
	theme.white800 = def.color.white800
	theme.white1000 = def.color.white1000
	theme.white1200 = def.color.white1200
	theme.white1400 = def.color.white1400
	theme.white1600 = def.color.white1600
	theme.white1800 = def.color.white1800
	theme.white2000 = def.color.white2000
	theme.white2200 = def.color.white2200
	theme.white2400 = def.color.white2400
	theme.white2600 = def.color.white2600
	theme.white2800 = def.color.white2800
	theme.white3000 = def.color.white3000

	theme.fg = def.color.fg
	theme.black200 = def.color.black200
	theme.black400 = def.color.black400
	theme.black600 = def.color.black600
	theme.black800 = def.color.black800
	
	theme.red000 = def.color.red000
	theme.red200 = def.color.red200
	theme.red400 = def.color.red400
	theme.red600 = def.color.red600

	theme.green000 = def.color.green000
	theme.green200 = def.color.green200
	theme.green400 = def.color.green400
	theme.green600 = def.color.green600

	theme.yellow000 = def.color.yellow000
	theme.yellow200 = def.color.yellow200
	theme.yellow400 = def.color.yellow400
	theme.yellow600 = def.color.yellow600

	theme.blue000 = def.color.blue000
	theme.blue200 = def.color.blue200
	theme.blue400 = def.color.blue400
	theme.blue600 = def.color.blue600

	theme.blue000 = def.color.magenta000
	theme.magenta200 = def.color.magenta200
	theme.magenta400 = def.color.magenta400
	theme.magenta600 = def.color.magenta600

	theme.cyan000 = def.color.cyan000
	theme.cyan200 = def.color.cyan200
	theme.cyan400 = def.color.cyan400
	theme.cyan600 = def.color.cyan600

	theme.useless_gap = dpi(10)
	theme.border_width = dpi(0)

	theme.tag_empty_icon = recolor(icons_path.."tag_unsel.svg", def.color.white400)
	theme.tag_occupied_icon = recolor(icons_path.."tag_unsel.svg", def.color.white1600)
	theme.tag_focus_icon = recolor(icons_path.."tag_sel.svg", def.color.black800)

	theme.vol_full_icon = loads(icons_path.."vol_full.svg")
	theme.vol_high_icon = loads(icons_path.."vol_high.svg")
	theme.vol_medium_icon = loads(icons_path.."vol_medium.svg")
	theme.vol_low_icon = loads(icons_path.."vol_low.svg")
	theme.vol_vlow_icon = loads(icons_path.."vol_vlow.svg")
	theme.vol_off_icon = loads(icons_path.."vol_off.svg")
	theme.vol_mute_icon = loads(icons_path.."vol_full.svg")

	theme.power_icon = loads(icons_path.."power.svg")
	theme.shutdown_icon = loads(icons_path.."shutdown.svg")
	theme.restart_icon = loads(icons_path.."restart.svg")
	theme.logout_icon = loads(icons_path.."logout.svg")

	theme.notification_spacing = dpi(36)
	theme.notification_shape =	
		function(cr, width, height)                                                  				
			gears.shape.solid_rectangle_shadow(cr, width, height, dpi(4), dpi(4))				
	        end

	theme.parent_filter_list = {"firefox", "Gimp"}
	theme.child_filter_list = { "Dragon" } 
	theme.swallowing_filter = true        

	theme.tooltip_opacity = 0
	theme.icon_theme = nil

return theme
