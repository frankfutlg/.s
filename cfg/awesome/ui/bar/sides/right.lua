local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local power = require("ui.bar.modules.power")
local wibox = require("wibox")

return function(s)
	local top_right = awful.popup {
		screen = s,
		widget = wibox.container.background,
		ontop = false,
		bg = beautiful.red200,
		visible = true,
		placement = function(c) awful.placement.top_right(c, { margins = dpi(20) }) end,
		shape = function(cr, width, height)
			gears.shape.solid_rectangle_shadow(cr, width, height, 4, 4)
		end
	}

	top_right:struts {
		top = dpi(60)
	}

	top_right:setup {
		nil,
		nil,
		power,
		layout = wibox.layout.fixed.horizontal
	}
end
