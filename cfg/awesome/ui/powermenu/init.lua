local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local pbtn = require("ui.powermenu.powerbtn")
local dpi = beautiful.xresources.apply_dpi

local powermenuBox = wibox {
	width = dpi(270),
	height = dpi(90),
	bg = beautiful.bg,
	ontop = true,
	visible = false,
	shape = function(cr, width, height)
		gears.shape.rectangle(cr, width, height)
	end
}

powermenuBox:setup {
	pbtn { image = beautiful.shutdown_btn, onclick = "systemctl poweroff" },
	pbtn { image = beautiful.reboot_btn, onclick = "systemctl reboot" },
	pbtn { image = beautiful.logout_btn, onclick = "awesome-client command 'awesome.quit()'" },
	layout = wibox.layout.align.horizontal
}

awesome.connect_signal("widget::powermenu", function()
	powermenuBox.visible = not powermenuBox.visible

	awful.placement.top_right(
		powermenuBox, 
		{
			margins = { 
				top = dpi(44), 
				right = dpi(8)
			}, 
			parent = awful.screen.focused()
		}
	)
end)
