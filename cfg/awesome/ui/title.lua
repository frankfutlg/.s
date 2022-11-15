local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Add titlebar
client.connect_signal("request::titlebars", function(c)
	closebtn = wibox.widget {
		buttons = {
			awful.button(
				{ }, 1, function()
					if client.focus then
						c:kill()
					end
				end
			), 
		},

		image = beautiful.close_btn,
		scaling_quality = "nearest",
		widget = wibox.widget.imagebox
	}

	awful.titlebar(c, { position = 'left', size = dpi(35) } ).widget = {
		expand = "none",
		layout = wibox.layout.align.vertical,
			{ -- Top
				{
					awful.titlebar.widget.floatingbutton(c),
					widget = wibox.container.margin,
					top = dpi(10),
					right = dpi(10),
					left = dpi(10)
				},
				layout  = wibox.layout.fixed.vertical
			},
			nil, -- Center (null)
			{ -- Bottom
				{
					awful.titlebar.widget.closebutton(c),
					widget = wibox.container.margin,
					bottom = dpi(10),
					right = dpi(10),
					left = dpi(10)
				},
				layout = wibox.layout.fixed.vertical
			},
	}
end)
