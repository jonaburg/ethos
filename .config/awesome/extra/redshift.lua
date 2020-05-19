-------------------------------------------------
-- red shifter
-------------------------------------------------
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local math, string, tag, tonumber, type, os = math, string, tag, tonumber, type, os
local naughty = require("naughty")
local theme_assets = require("beautiful.theme_assets")
local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme                                     = {}


local checkgamma = [[bash -c 'cat /home/jon/.local/bin/utilities/RV']]

function readgamma ()
	awful.spawn.easy_async([[bash -c 'cat /home/jon/.local/bin/utilities/RV']],
	function (stdout,stderr,reason,exit_code)
		_G.colortemp = tostring(stdout) or 0
		naughty.notify{
		text = stdout,
		title = "",
		timeout = 10, hover_timeout = 1,
		width = 500,
		position = 'top_middle',
		}
	end)
end


function readctglobal ()
		naughty.notify{
		text = _G.colortemp,
		title = "",
		timeout = 10, hover_timeout = 1,
		width = 500,
		position = 'top_middle',
		}
end


function setinfo()
	red_bar:set_value(_G.colortemp)
	temp_text:set_text("   " .. _G.colortemp or nil)
end

--local colortemp = tostring(stdout) or 0

--watch(readgamma, 2)
---function getgamma()
--	--awful.spawn.easy_async([[bash -c 'cat ~/.local/bin/utilities/RV']],
--function (widget, stdout, stderr, exitreason, exitcode)
--	local colortemp = tostring(stdout) or 0
--	end
--end)
--


local colortemp = 6750
--local colortemp = 6750
-- Create the text widget
temp_text = wibox.widget{
	    font = "Inconsolata 9",
		text = "    " .. colortemp,
	        widget = wibox.widget.textbox,
	}
back_box = wibox.widget{
   	        font = "Inconsolata 9",
		fg = "#000000",
		bg = "#ffffff",
		temp_text,
		shape = gears.shape.hexagon,
		widget = wibox.container.background,
	}

-- Create the bar widget
red_bar = wibox.widget{
        max_value     = 6750,
        value         = colortemp,
        forced_height = 10,
        forced_width  = 100,
        paddings      = 1,
        border_width  = 1,
	background_color = "#4433ff",
        border_color  =  "#ff0000",
	shape 	      = gears.shape.hexagon,
        widget        = wibox.widget.progressbar,
    }
-- Combine them together
redshift = wibox.widget{
red_bar,
back_box,
layout = wibox.layout.stack
}



red_bar:connect_signal("mouse::enter", function() readgamma() end)
red_bar:connect_signal("mouse::leave", function() setinfo() end)

-- Export the widget
return redshift

