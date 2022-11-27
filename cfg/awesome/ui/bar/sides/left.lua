local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local taglist = require("ui.bar.modules.taglist")
local wibox = require("wibox")

return function(s)
	local top_left = awful.popup {
		screen = s,
		widget = wibox.container.background,
		ontop = false,
		bg = beautiful.white1400,
		visible = true,
		placement = function(c) awful.placement.top_left(c, { margins = dpi(20) }) end,
		shape = function(cr, width, height)
			gears.shape.solid_rectangle_shadow(cr, width, height, 4, 4)
		end
	}

	top_left:struts {
		top = dpi(60)
	}

	top_left:setup {
		taglist(s),
		layout = wibox.layout.fixed.horizontal
	}
end
