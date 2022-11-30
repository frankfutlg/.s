local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Powermenu button
local layoutbox = wibox.widget {
	{
		{
			align = "center",
			valign = "center",
			widget = wibox.widget.layoutbox
		},

		id = "date_role",
		bg = beautiful.yellow400,
		fg = beautiful.black800,
		widget = wibox.container.background
	},

	        buttons = {
		            awful.button({ }, 1, function () awful.layout.inc( 1) end),
			                awful.button({ }, 3, function () awful.layout.inc(-1) end),
					        }
}

local actualayoutbox = wibox.widget {
	{
		{
		        layoutbox,
			right = dpi(4),
			bottom = dpi(4),
	                widget = wibox.container.margin
		},

		width = dpi(36),
		height = dpi(36),
		strategy = "exact",
		widget = wibox.container.constraint
	},

	bg = beautiful.yellow200,
	widget = wibox.container.background
}

return actualdate
