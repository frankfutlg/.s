local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Add titlebar
client.connect_signal("request::titlebars", function(c)
	awful.titlebar(c, { position = 'bottom', size = dpi(6) } ).widget = {
		layout = wibox.layout.align.horizontal
	}
	awful.titlebar(c, { position = 'right', size = dpi(6) } ).widget = {
		layout = wibox.layout.align.vertical
	}
end)
