local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local pbtn = require("ui.powermenu.powerbtn")
local dpi = beautiful.xresources.apply_dpi

local powermenuBox = wibox {
	width = dpi(176),
	height = dpi(72),
	bg = gears.color.transparent,
	ontop = true,
	visible = false,
	type = "dock",
	shape = function(cr, width, height)
		gears.shape.solid_rectangle_shadow(cr, width, height, 4, 4)
	end
}

local powerbuttons = wibox.widget {
	{
		pbtn { 
			image = beautiful.shutdown_icon,
			lowcol = beautiful.red200,
			midcol = beautiful.red400,
			topcol = beautiful.red600,
			onclick = "doas poweroff"
		},

	       	pbtn { 
	       		image = beautiful.restart_icon,
	       		lowcol = beautiful.green200,
	       		midcol = beautiful.green400,
	       		topcol = beautiful.green600,
	       		onclick = "doas reboot"
	       	},

		pbtn { 
			image = beautiful.logout_icon,
			lowcol = beautiful.blue200,
			midcol = beautiful.blue400,
			topcol = beautiful.blue600,
			onclick = "awesome-client command 'awesome.quit()'"
		},
		
		spacing = dpi(16),
		layout = wibox.layout.fixed.horizontal
	},

	align = "center",
	widget = wibox.container.place
}

powermenuBox:setup {
	nil,
	{
		{
			{
				powerbuttons,
				bg = beautiful.bg,
				widget = wibox.container.background
			},
			
			bottom = dpi(4),
			right = dpi(4),
			widget = wibox.container.margin
		},

		bg = beautiful.white1200,
		widget = wibox.container.background
	},
	nil,
	layout = wibox.layout.align.horizontal,
	expand = none
}

awesome.connect_signal("widget::powermenu", function()
	powermenuBox.visible = not powermenuBox.visible

	awful.placement.top_right(
		powermenuBox, 
		{	
			margins = {
				top = dpi(76),
				right = dpi(20)
			},
			parent = awful.screen.focused()
		}
	)
end)
