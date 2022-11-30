local awful = require("awful")
local naughty = require("naughty")
local gfs = require("gears.filesystem")
local script_dir = gfs.get_configuration_dir().."scripts/"
local beautiful = require("beautiful")
local gears = require("gears")
local bling = require("addons.bling")

-- Default layouts and tags
screen.connect_signal("request::desktop_decoration", function(s)
	tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.tile,
		awful.layout.suit.floating,
	})
end)

awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
end)

-- Focus follows pointer
client.connect_signal("mouse::enter", function(c)
	c:activate { context = "mouse_enter", raise = false }
end)

-- Wallpaper
screen.connect_signal("request::wallpaper", function(s)
	if beautiful.wallpaper then
		gears.wallpaper.maximized(beautiful.wallpaper, s, false, nil)
	end
end)

-- Handle errors
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification {
		urgency = "critical",
		title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
		message = message
    }
end)

-- Colect garbage for preventing memory leaks
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
	timeout = 5,
	autostart = true,
	call_now = true,
	callback = function()
		collectgarbage("collect")
	end,
})

-- Auto focus
require("awful.autofocus")

-- Window swallowing support (bling)
bling.module.window_swallowing.start()
