local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Add titlebar
client.connect_signal("request::titlebars", function(c)
	awful.titlebar(c, { position = 'bottom', bg = gears.color.transparent, size = dpi(4) } ).widget = {
		layout = wibox.layout.align.horizontal,
		{
			forced_width = dpi(4),
			widget = wibox.container.background
		},
		{
			forced_width = dpi(4),
			bg = beautiful.white1200,
			widget = wibox.container.background
		},
		widget = wibox.container.background
	}

	awful.titlebar(c, { position = 'right', bg = gears.color.transparent, size = dpi(4) } ).widget = {
		layout = wibox.layout.align.vertical,
		{
			forced_height = dpi(4),
			widget = wibox.container.background
		},
		{
			forced_height = dpi(4),
			bg = beautiful.white1200,
			widget = wibox.container.background
		},
	}
end)
