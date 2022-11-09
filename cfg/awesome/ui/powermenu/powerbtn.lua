local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local pbutton = function(args)
	local image = args.image
	local onclick = args.onclick or function() end

	local btn = wibox.widget {
		{
			{
				image = image,
				scaling_quality = "nearest",
				align = "center",
				valign = "center",
				widget = wibox.widget.imagebox
			},

			margins = dpi(25),
			widget = wibox.container.margin
		},
	
		id = "btn_role",
		bg = beautiful.bg,
		widget = wibox.container.background
	}

	btn:connect_signal("mouse::enter", function(self)
		local btncol = self:get_children_by_id("btn_role")[1]
		btncol.bg = beautiful.bg_1
	end)

	btn:connect_signal("mouse::leave", function(self)
		local btncol = self:get_children_by_id("btn_role")[1]
		btncol.bg = beautiful.bg
	end)

	btn:connect_signal("button::press", function()
		awesome.emit_signal("widget::powermenu")
		awful.spawn.with_shell(onclick)
	end)

	return btn
end

return pbutton
