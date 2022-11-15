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
	theme.bg_1 = def.color.bg_1
	theme.bg_2 = def.color.bg_2
	theme.bg_3 = def.color.bg_3

	theme.fg = def.color.fg
	theme.fg_1 = def.color.fg_1
	theme.fg_2 = def.color.fg_2

	theme.red = def.color.red
	theme.green = def.color.green
	theme.yellow = def.color.yellow
	theme.blue = def.color.blue
	theme.magenta = def.color.magenta
	theme.cyan = def.color.cyan

	theme.useless_gap = dpi(8)
	theme.border_width = dpi(0)

	theme.border_color_normal = def.color.bg_1
	theme.border_color_active = def.color.bg_1
	theme.border_color_marked = def.color.bg_1

	theme.titlebar_bg_normal = def.color.bg_1
	theme.titlebar_bg_focus  = def.color.bg_1

	theme.titlebar_fg_normal = def.color.bg_1
	theme.titlebar_fg_focus  = def.color.fg

	theme.titlebar_floating_button_normal_inactive = recolor(icons_path.."floating_inactive.png", def.color.bg_1)
	theme.titlebar_floating_button_focus_inactive  = recolor(icons_path.."floating_inactive.png", def.color.fg)

	theme.titlebar_floating_button_normal_active = recolor(icons_path.."floating_active.png", def.color.bg_1)
	theme.titlebar_floating_button_focus_active  = recolor(icons_path.."floating_active.png", def.color.fg_2)

	theme.titlebar_floating_button_focus_inactive_hover = recolor(icons_path.."floating_inactive.png", def.color.fg_2)
	theme.titlebar_floating_button_focus_active_hover = recolor(icons_path.."floating_active.png", def.color.fg)

	theme.titlebar_close_button_normal = recolor(icons_path.."close.png", def.color.bg_1)
	theme.titlebar_close_button_focus = recolor(icons_path.."close.png", def.color.fg)
	theme.titlebar_close_button_focus_hover = recolor(icons_path.."close.png", def.color.fg_2)

	theme.tag_empty_icon = recolor(icons_path.."tag_unsel.png", def.color.bg_3)
	theme.tag_occupied_icon = recolor(icons_path.."tag_unsel.png", def.color.fg)
	theme.tag_focus_icon = recolor(icons_path.."tag_sel.png", def.color.fg)

	theme.shutdown_btn = loads(icons_path.."shutdown.png")
	theme.reboot_btn = loads(icons_path.."reboot.png")
	theme.logout_btn = loads(icons_path.."logout.png")

	theme.notification_spacing = dpi(8)

--	theme.parent_filter_list = {"firefox", "Gimp"}
--	theme.child_filter_list = { "Dragon" } 
--	theme.swallowing_filter = true        

	theme.tooltip_opacity = 0
	theme.icon_theme = nil

return theme
