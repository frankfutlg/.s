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

local poweractualbtn = wibox.widget {
	shape = function(cr, width, height)                                 
        	gears.shape.solid_rectangle_shadow(cr, width, height, 4, 4)
        end,

	{ 
		{
		        powerbtn,
			id = "btnm_role",
			right = dpi(4),
			bottom = dpi(4),
	                widget = wibox.container.margin
		},

		width = dpi(36),
		height = dpi(36),
		strategy = "exact",
		widget = wibox.container.constraint
	},
	
	id = "btnbg_role",
	bg = beautiful.red200,
	widget = wibox.container.background
}


poweractualbtn:connect_signal("button::press", function(self, _, _, button)
	if button == 1 then
		local btnm = self:get_children_by_id("btnm_role")[1]
		local btnobg = self:get_children_by_id("btnbg_role")[1]
		btnm.bottom = dpi(0)
		btnm.right = dpi(0)
		btnm.top = dpi(4)
		btnm.left = dpi(4)
		btnobg.bg = gears.color.transparent
	end
end)

poweractualbtn:connect_signal("button::release", function(self, _, _, button)
	if button == 1 then
		local btnm = self:get_children_by_id("btnm_role")[1]
		local btnobg = self:get_children_by_id("btnbg_role")[1]
		btnm.bottom = dpi(4)
		btnm.right = dpi(4)
		btnm.top = dpi(0)
		btnm.left = dpi(0)
		btnobg.bg = beautiful.red200
	end
end)

powerbtn:connect_signal("mouse::enter", function(self)
	local btncol = self:get_children_by_id("powerbtn_role")[1]
	btncol.bg = beautiful.red600
end)

powerbtn:connect_signal("mouse::leave", function(self)
	local btncol = self:get_children_by_id("powerbtn_role")[1]
	btncol.bg = beautiful.red400
end)

return poweractualbtn
