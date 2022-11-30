local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local taglist = require("ui.bar.modules.taglist")
--local layoutbox = require("ui.bar.modules.layoutbox")
local wibox = require("wibox")

return function(s)
	local top_left = awful.popup {
		screen = s,
		widget = wibox.container.background,
		ontop = false,
		bg = gears.color.transparent,
		visible = true,
		placement = function(c) awful.placement.top_left(c, { margins = dpi(20) }) end,
		shape = function(cr, width, height)
			gears.shape.rectangle(cr, width, height)
		end
	}

	top_left:struts {
		top = dpi(60)
	}

	top_left:setup {
		taglist(s),
--		layoutbox,
		spacing = dpi(10),
		layout = wibox.layout.fixed.horizontal
	}
end
