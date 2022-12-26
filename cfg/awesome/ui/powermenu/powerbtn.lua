local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi

local pbutton = function(args)
	local image = args.image
	local lowcol = args.lowcol
	local midcol = args.midcol
	local topcol = args.topcol
	local onclick = args.onclick or function() end

	local btn = wibox.widget {
		{
			shape = function(cr, width, height)                                 
				gears.shape.solid_rectangle_shadow(cr, width, height, dpi(4), dpi(4))
			end,
			{
					{
						{
							{
								image = image,
								scaling_quality = "nearest",
								align = "center",
								valign = "center",
								widget = wibox.widget.imagebox
							},

							margins = dpi(11),
							widget = wibox.container.margin
						},
	
						id = "btn_role",
						bg = midcol,
						widget = wibox.container.background
					},
			
					right = dpi(4),
					bottom = dpi(4),
					widget = wibox.container.margin
				},

				bg = lowcol,
				widget = wibox.container.background
			},

			width = dpi(36),
			height = dpi(36),
			strategy = "exact",
			widget = wibox.container.constraint
	}

	btn:connect_signal("mouse::enter", function(self)
		local btncol = self:get_children_by_id("btn_role")[1]
		btncol.bg = topcol
	end)

	btn:connect_signal("mouse::leave", function(self)
		local btncol = self:get_children_by_id("btn_role")[1]
		btncol.bg = midcol
	end)

	btn:connect_signal("button::press", function()
		awesome.emit_signal("widget::powermenu")
		awful.spawn.with_shell(onclick)
	end)

	return btn
end

return pbutton
