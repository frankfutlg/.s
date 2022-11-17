local awful = require("awful")
local def = require("conf.defaults")

-- Aliases for the used keys
super = "Mod4"
shift = "Shift"
ctrl = "Control"
alt = "Mod1"

-- Bindings that have nothing to do with AwesomeWM itself (e.g Launching programs)
awful.keyboard.append_global_keybindings({
	awful.key(
		{ super }, "c", function()
			awful.spawn(def.app.launcher)
		end
	),

	awful.key(
		{ super }, "Return", function()
			awful.spawn(def.app.term)
		end
	),

	awful.key(
		{ super }, "y", function()
			awful.spawn("ytfzf -D -l")
		end),

	awful.key(
		{ super }, "a", function()
			awful.spawn(def.app.term .. " -e ani-cli -q best -f")
		end
	),

	awful.key(
		{ }, "Print", function()
			awful.spawn.with_shell(def.script.shot_full)
		end
	),
	
	awful.key(
		{ shift }, "Print", function()
			awful.spawn.with_shell(def.script.shot_area)
		end
	),

	awful.key(
		{ super }, "Print", function()
			awful.spawn.with_shell(def.script.shot_client)
		end
	),
	
	awful.key(
		{ super, alt }, "g", function()
			awful.spawn.with_shell(def.script.git_kcopy)
		end
	),

	awful.key(
		{ super, alt }, "c", function()
			awful.spawn.with_shell(def.script.cclear)
		end
	),

	awful.key(
		{ }, "XF86AudioRaiseVolume", function()
			awful.spawn.with_shell("pamixer -i 5")
		end
	),

	awful.key(
		{ }, "XF86AudioLowerVolume", function()
			awful.spawn.with_shell("pamixer -d 5")
		end
	),

	awful.key(
		{ }, "XF86AudioMute", function() 
			awful.spawn.with_shell("pamixer -t") 
		end
	),
})

-- AwesomeWM related bindings
awful.keyboard.append_global_keybindings({
	awful.key(
		{ super, ctrl }, "q",
			awesome.quit
	),

	awful.key(
		{ super, shift }, "r",
			awesome.restart
	),
})

-- Window management related bindings
awful.keyboard.append_global_keybindings({
    	awful.key(
		{ super, shift }, "j", function()
			awful.client.swap.byidx(-1)
		end
	),

   	awful.key(
		{ super, shift }, "k", function()
			awful.client.swap.byidx( 1)
		end
	),

    	awful.key(
		{ super }, "j", function()
			awful.client.focus.byidx(-1)
		end
	),

   	awful.key(
		{ super }, "k", function()
			awful.client.focus.byidx( 1)
		end
	),

	awful.key(
		{ super }, "h", function()
			awful.tag.incmwfact(-0.05)
		end
	),

	awful.key(
		{ super }, "l", function()
			awful.tag.incmwfact( 0.05)
		end
	),
})


-- Tags related bindings
awful.keyboard.append_global_keybindings({
	awful.key(
		{ super }, "Left",
			awful.tag.viewprev
	),

	awful.key(
		{ super }, "Right",
			awful.tag.viewnext
	),

	awful.key {
		modifiers = { super },
		keygroup = "numrow",
		on_press = function(index)

		local screen = awful.screen.focused()
		local tag = screen.tags[index]

		if tag then
			tag:view_only()
		end
        end
	},

	awful.key {
		modifiers = { super, shift },
		keygroup = "numrow",
		on_press = function(index)

		if client.focus then
			local tag = client.focus.screen.tags[index]
			if tag then
				client.focus:move_to_tag(tag)
				tag:view_only()
			end
		end
	end
	}
})

-- Client/Layout related bindings
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
        	awful.key(
			{ super }, "f", function(c)
                		c.fullscreen = not c.fullscreen
                		c:raise()
            		end
		),

        	awful.key(
			{ super }, "m", function(c)
                		c.maximized = not c.maximized
                		c:raise()
            		end
		),

		awful.key(
			{ super }, "space", function(c)
				c.floating = not c.floating
				c:raise()
			end
		),
	
		awful.key(
			{ super }, "q", function(c)
				c:kill()
			end
		),
	})
end)

client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button(
			{ }, 1, function(c)
				c:activate { context = "mouse_click" }
        		end
		),

        	awful.button(
			{ super }, 1, function(c)
	            		c:activate { context = "mouse_click", action = "mouse_move"  }
	        	end
		),

        	awful.button(
			{ super }, 3, function(c)
	            		c:activate { context = "mouse_click", action = "mouse_resize"}
			end
		),
	})
end)
