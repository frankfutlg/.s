local awful = require("awful")

awful.screen.connect_for_each_screen(
	function(s)
	  	require("ui.bar.sides.left")(s)
		require("ui.bar.sides.center")(s)
		require("ui.bar.sides.right")(s)
end)
