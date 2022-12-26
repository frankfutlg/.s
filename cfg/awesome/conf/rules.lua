local awful = require("awful")
local ruled = require("ruled")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- New clients
ruled.client.connect_signal("request::rules", function()
	ruled.client.append_rule {
		id = "global",
		rule = { },
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_offscreen+awful.placement.centered
		}
	}
end)

ruled.client.connect_signal("request::rules", function()
	ruled.client.append_rule {
		id = "global",
		rule = { },
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	}

	ruled.client.append_rule {
		id = "floating",
		rule_any = {
			name = {
				"Event Tester",  -- xev.
			},
		},

		properties = { floating = true }
	}

	ruled.client.append_rule { -- Add titlebar for normal and dialog windows
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true	}
	}
end)

-- Notifications
ruled.notification.connect_signal('request::rules', function()
	-- Critical
    ruled.notification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = beautiful.bg, fg = beautiful.red000, implicit_timeout = 7 }
    }

	-- Normal
    ruled.notification.append_rule {
        rule       = { urgency = 'normal' },
        properties = { bg = beautiful.bg, fg = beautiful.fg, implicit_timeout = 5 }
    }

	-- Low
    ruled.notification.append_rule {
        rule       = { urgency = 'low' },
        properties = { bg = beautiful.bg, fg = beautiful.green000, implicit_timeout = 3 }
    }
end)
