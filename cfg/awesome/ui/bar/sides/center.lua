local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local datebox = require("ui.bar.modules.date")
local wibox = require("wibox")

return function(s)
	local top_center = awful.popup {
		screen = s,
		widget = wibox.container.background,
		ontop = false,
		bg = gears.color.transparent,
		visible = true,
		placement = function(c) awful.placement.top(c, { margins = dpi(20) }) end,
		shape = function(cr, width, height)
			gears.shape.solid_rectangle_shadow(cr, width, height, 4, 4)
		end
	}

	top_center:struts {
		top = dpi(60)
	}

	top_center:setup {
		datebox,
		layout = wibox.layout.fixed.horizontal
	}
end
