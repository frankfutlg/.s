local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local naughty = require("naughty")
local wibox = require("wibox")

naughty.config.defaults.ontop = true
naughty.config.defaults.timeout = 5
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.border_width = 0
naughty.config.defaults.position = "bottom_right"
naughty.config.defaults.title = "Notification"

naughty.connect_signal("request::display", function(n)
	naughty.layout.box {
		notification = n,
		type = "notification",
		bg = beautiful.white1200,

		widget_template = {
			{
				{
					{
						{
							{
								{
									naughty.widget.title,
									forced_height = dpi(30),
									layout = wibox.layout.align.horizontal
								},

								left = dpi(10),
								right = dpi(10),
								widget = wibox.container.margin
							},

							bg = beautiful.white200,
							widget = wibox.container.background
						},

						strategy = "min",
						width = dpi(175),
						widget = wibox.container.constraint
					},

					strategy = "max",
					width = dpi(400),
					widget = wibox.container.constraint
				},

				{
					{
						{
						
							{
								naughty.widget.message,
								left = dpi(10),
								right = dpi(10),
								top = dpi(10),
								bottom = dpi(10),
								widget = wibox.container.margin
							},
	
							strategy = "min",
							height = dpi(42),
							widget = wibox.container.constraint
						},

						strategy = "max",
						width = dpi(400),
						height = dpi(86),
						widget = wibox.container.constraint
					},
				
					bg = beautiful.bg,
					widget = wibox.container.background
				},

				layout = wibox.layout.align.vertical
			},	

			right = dpi(4),
			bottom = dpi(4),
			widget = wibox.container.margin
		}
	}
end)
