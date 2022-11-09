local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local get_taglist = function(s)
	local taglist_buttons = gears.table.join(
		awful.button(
			{ }, 1, function(tag)
				tag:view_only()
			end
		),

		awful.button(
			{ }, 3,
				awful.tag.viewtoggle
		),

		awful.button(
			{ }, 4, function(t)
				awful.tag.viewnext(t.screen)
			end
		),
		
		awful.button(
			{ }, 5, function(t)
				awful.tag.viewprev(t.screen)
			end
		)
	)

	local empty_icon = beautiful.tag_empty_icon
	local occupied_icon = beautiful.tag_occupied_icon
	local sel_icon = beautiful.tag_focus_icon

	local update_tags = function(self, c3)
		local tagicon = self:get_children_by_id('icon_role')[1]
		if c3.selected then
			tagicon.image = sel_icon
		elseif #c3:clients() == 0 then
			tagicon.image = empty_icon
		else
			tagicon.image = occupied_icon
		end
	end

	local icon_taglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		layout = {
			spacing = 4, 
			layout = wibox.layout.fixed.horizontal
		},
		widget_template = {
			{
				{
					id = 'icon_role',
					scaling_quality = "nearest",
					widget = wibox.widget.imagebox
				},
				id = 'margin_role',
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background,
			create_callback = function(self, c3, index, objects)
				update_tags(self, c3)       
			end,

			update_callback = function(self, c3, index, objects)
				update_tags(self, c3)
			end
		},
	buttons = taglist_buttons
}

	return icon_taglist
end

return get_taglist
