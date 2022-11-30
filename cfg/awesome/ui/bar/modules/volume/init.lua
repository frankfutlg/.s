local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local gfs = require("gears.filesystem")
local icons_path = gfs.get_configuration_dir().."theme/assets/icons/"
local dpi = xresources.apply_dpi
require("ui.bar.modules.volume.signal")

local volicon = wibox.widget {
	scaling_quality = "nearest",
	align = "center",
	valign = "center",
	widget = wibox.widget.imagebox
}

local volbtn = wibox.widget {
	{
		{
			volicon,
			widget = wibox.container.margin
		},

		margins = dpi(11),
		widget = wibox.container.margin
	},
	
	widget = wibox.container.background
}

local volactualbtn = wibox.widget {
	shape = function(cr, width, height)                                 
        	gears.shape.solid_rectangle_shadow(cr, width, height, 4, 4)
        end,

	{ 
		{
		        volbtn,
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
	
	widget = wibox.container.background,
}

awesome.connect_signal("signal::volume", function(volume, muted)
	if muted == 1 then
		image = beautiful.vol_mute_icon
		lltone = beautiful.white1200
		ltone = beautiful.white1400
		dtone = beautiful.white1600
		ddtone = beautiful.white1800
	else
		if volume >= 100 then
			image = beautiful.vol_full_icon
			lltone = beautiful.green600
			ltone = beautiful.green400
			dtone = beautiful.green200
			ddtone = beautiful.green000
		elseif volume >= 75 then
			image = beautiful.vol_high_icon
			lltone = beautiful.blue600
			ltone = beautiful.blue400
			dtone = beautiful.blue200
			ddtone = beautiful.blue000
		elseif volume >= 50 then
			image = beautiful.vol_medium_icon
			lltone = beautiful.yellow600
			ltone = beautiful.yellow400
			dtone = beautiful.yellow200
			ddtone = beautiful.yellow000
		elseif volume >= 25 then
			image = beautiful.vol_low_icon
			lltone = beautiful.red600
			ltone = beautiful.red400
			dtone = beautiful.red200
			ddtone = beautiful.red000
		elseif volume >= 1 then
			image = beautiful.vol_vlow_icon
			lltone = beautiful.magenta600
			ltone = beautiful.magenta400
			dtone = beautiful.magenta200
			ddtone = beautiful.magenta000
		elseif volume == 0 then
			image = beautiful.vol_off_icon
			lltone = beautiful.white600
			ltone = beautiful.white1000
			dtone = beautiful.white1200
			ddtone = beautiful.white1400
		end
	end

	volicon.image = image
	volbtn.bg = ltone
	volactualbtn.bg = dtone
end)

return volactualbtn