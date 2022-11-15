local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Powermenu button
local powerbtn = wibox.widget {
	buttons = {
		awful.button(
			{ }, 1, function()
				awesome.emit_signal("widget::powermenu")
			end
		)
	},

	{
		{
			image = beautiful.shutdown_btn,
			scaling_quality = "nearest",
			align = "center",
			valign = "center",
			widget = wibox.widget.imagebox
		},

		margins = dpi(12),
		widget = wibox.container.margin
	},
	
	id = "powerbtn_role",
	bg = beautiful.bg,
	widget = wibox.container.background
}

powerbtn:connect_signal("mouse::enter", function(self)
	local btncol = self:get_children_by_id("powerbtn_role")[1]
	btncol.bg = beautiful.bg_1
end)

powerbtn:connect_signal("mouse::leave", function(self)
	local btncol = self:get_children_by_id("powerbtn_role")[1]
	btncol.bg = beautiful.bg
end)

return powerbtn
