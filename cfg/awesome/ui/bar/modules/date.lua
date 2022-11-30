local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Powermenu button
local date = wibox.widget {
	{
		format = "%d %b, %I:%M %P",		
		align = "center",
		valign = "center",
		widget = wibox.widget.textclock
	},

	bg = beautiful.bg,
	fg = beautiful.fg,
	widget = wibox.container.background
}

local actualdate = wibox.widget {
	{
		{
		        date,
			right = dpi(4),
			bottom = dpi(4),
	                widget = wibox.container.margin
		},

		width = dpi(140),
		height = dpi(36),
		strategy = "exact",
		widget = wibox.container.constraint
	},

	bg = beautiful.white1600,
	widget = wibox.container.background
}

return actualdate
