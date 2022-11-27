local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local gfs = require("gears.filesystem")
local icons_path = gfs.get_configuration_dir().."theme/assets/icons/"
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
			image = gears.color.recolor_image(icons_path.."shutdown.png", beautiful.fg),
			scaling_quality = "nearest",
			align = "center",
			valign = "center",
			widget = wibox.widget.imagebox
		},

		margins = dpi(11),
		widget = wibox.container.margin
	},

	id = "powerbtn_role",
	bg = beautiful.red400,
	widget = wibox.container.background
}

powerbtn:connect_signal("mouse::enter", function(self)
	local btncol = self:get_children_by_id("powerbtn_role")[1]
	btncol.bg = beautiful.red600
end)

powerbtn:connect_signal("mouse::leave", function(self)
	local btncol = self:get_children_by_id("powerbtn_role")[1]
	btncol.bg = beautiful.red400
end)

local poweractualbtn = wibox.widget {
	{
	        powerbtn,
		right = dpi(4),
		bottom = dpi(4),
                widget = wibox.container.margin
	},

	width = dpi(36),
	height = dpi(36),
	strategy = "exact",
	widget = wibox.container.constraint
}

return poweractualbtn
