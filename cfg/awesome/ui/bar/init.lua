local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local taglist = require("ui.bar.taglist")
local power = require("ui.bar.power")
local dpi = beautiful.xresources.apply_dpi


-- Wibar
screen.connect_signal("request::desktop_decoration", function(s)
		s.wibox = awful.wibar {
			position = "top",
			height = dpi(36),
			bg = beautiful.bg,
			fg = beautiful.fg,
			screen   = s,
			widget   = {
				expand = "none",
				layout = wibox.layout.align.horizontal,
					{ -- Start
						taglist(s),
						left = dpi(13),
						bottom = dpi(13),
						top = dpi(13),
						widget = wibox.container.margin
					},

					{ -- Center
						wibox.widget.textclock("%d %b, %I:%M %p"),
						widget = wibox.container.place
					},
					power
			}
		}
end)
