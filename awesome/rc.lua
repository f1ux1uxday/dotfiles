--  rc.lua
--  custom initialisation for awesome windowmanager 4.0.x
--
 -- Copyright (C) 2012, 2013 by Togan Muftuoglu <toganm@opensuse.org>
 -- Copyright (C) 2015, 2016 by Sorokin Alexei <sor.alexei@meowr.ru>
 -- This program is free software; you can redistribute it and/or
 -- modify it under the terms of the GNU General Public License as
 -- published by the Free Software Foundation; either version 2, or (at
 -- your option) any later version.

 -- This program is distributed in the hope that it will be useful, but
 -- WITHOUT ANY WARRANTY; without even the implied warranty of
 -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 -- General Public License for more details.

 -- You should have received a copy of the GNU General Public License
 -- along with GNU Emacs; see the file COPYING.  If not, write to the
 -- Free Software Foundation, Inc.,  51 Franklin Street, Fifth Floor,
 -- Boston, MA 02110-1301 USA


-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local exec = awful.util.spawn
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
naughty.resume()
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- Introspection
local lgi = require("lgi")
local gtk = lgi.require("Gtk", "3.0")
-- Freedesktop integration
local freedesktop = require("freedesktop")
-- calendar functions
-- local calendar2 = require("calendar2")
-- Extra widgets
local vicious = require("vicious")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- Use personal theme if existing else goto default.
do
    local user_theme, ut
    user_theme = awful.util.getdir("config") .. "/themes/theme.lua"
    ut = io.open(user_theme)
    if ut then
        io.close(ut)
        beautiful.init(user_theme)
    else
        print("Personal theme doesn't exist, falling back to openSUSE")
        beautiful.init(awful.util.get_themes_dir() .. "openSUSE/theme.lua")
    end
end

-- This is used later as the default terminal and editor to run.
terminal = "st"
-- editor = os.getenv("EDITOR") or os.getenv("VISUAL") or "vi"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

menubar.utils.terminal = terminal
theme.icon_theme = "Mondrian"

networks = {'wlp3s0'}

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local function lookup_icon(icon, size)
    local icon_theme = gtk.IconTheme.get_default()
    local icon_info = icon_theme:lookup_icon(icon, size, "USE_BUILTIN")
    return icon_info and icon_info:get_filename() or nil
end

mysystemmenu = {
   { "Lock Screen",     "light-locker-command --lock",  lookup_icon("system-lock-screen", 16) },
   { "Logout",           function() awesome.quit() end, lookup_icon("system-log-out", 16)     },
   { "Reboot System",   "systemctl reboot",             lookup_icon("system-restart", 16)       },
   { "Shutdown System", "systemctl poweroff",           lookup_icon("system-shutdown", 16)    }
}

myawesomemenu = {
   { "Restart Awesome", awesome.restart, lookup_icon("view-refresh", 16) },
   { "Edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "rc.lua", lookup_icon("package_settings", 16) },
   { "manual", terminal .. " -e man awesome", lookup_icon("help-browser", 16) }
}

mymainmenu = freedesktop.menu.build({
    before = {
        { "Awesome",  myawesomemenu,          beautiful.awesome_icon                },
    },
    after = {
        { "System",   mysystemmenu,           lookup_icon("preferences-system", 16) },
        { "Terminal", menubar.utils.terminal, lookup_icon("utilities-terminal", 16) }
    },
    skip_items = { "settings", "Settings", "Panel", "Jupyter Qt console", "atop", "Terminal", "Git Gui", "git-gui" }
})

mylauncher = awful.widget.launcher({ image = beautiful.opensuse_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- We need spacer and separator between the widgets
spacer = wibox.widget.textbox()
separator = wibox.widget.textbox()
spacer:set_text(" ")
separator:set_text("|")

-- Create a textclock widget
mytextclock = wibox.widget.textclock()
-- calendar2.addCalendarToWidget(mytextclock, "<span color='green'>%s</span>")

mycpuwidget = wibox.widget.textbox()
vicious.register(mycpuwidget, vicious.widgets.cpu, "$1%")

--[[ mybattery = wibox.widget.textbox()
vicious.register(mybattery, function(format, warg)
    local args = vicious.widgets.bat(format, warg)
    if args[2] < 50 then
        args['{color}'] = 'red'
    else
        args['{color}'] = 'green'
    end
    return args
end, '<span foreground="${color}">bat: $2% $3h</span>', 10, 'BAT0') ]]

-- Network widget
function print_net(name, down, up)
	return '<span color="'
	.. beautiful.fg_netdn_widget ..'">' .. down .. '</span> <span color="'
	.. beautiful.fg_netup_widget ..'">' .. up  .. '</span>'
end

netwidget = wibox.widget.textbox()

vicious.register(netwidget, vicious.widgets.net,
	function (widget, args)
		for _,device in pairs(networks) do
			if tonumber(args["{".. device .." carrier}"]) > 0 then
				netwidget.found = true
				return print_net(device, args["{"..device .." down_kb}"], args["{"..device.." up_kb}"])
			end
		end
	end, 3)
-- }}}

-- Volume widget
volwidget = wibox.widget.textbox()
volbar = wibox.widget.progressbar({
  forced_height = 100,
  forced_width  = 20,
  border_width = 1,
  border_color = "#fac901",
  background_color = "#000000",
  color = "#ffffff",
  layout = wibox.container.rotate
})
-- volwidget = widget({ type = "textbox" })
-- Progressbar properties
-- volbar:set_vertical(true):set_ticks(true)
-- volbar:set_height(16):set_width(8):set_ticks_size(2)
-- volbar:set_background_color(beautiful.fg_off_widget)
-- volbar:set_gradient_colors({ beautiful.fg_widget,
   -- beautiful.fg_center_widget, beautiful.fg_end_widget
-- }) -- Enable caching
vicious.cache(vicious.widgets.volume)
-- Register widgets
vicious.register(volbar, vicious.widgets.volume, "$1", 2, "Master")
vicious.register(volwidget, vicious.widgets.volume, " $1", 2, "Master")

-- Weather widget
myweatherwidget = wibox.widget.textbox()
weather_t = awful.tooltip({ objects = { myweatherwidget },})
vicious.register(myweatherwidget, vicious.widgets.weather,
          function (widget, args)
              weather_t:set_text("City: " .. args["{city}"] .."\nWind: " .. args["{windkmh}"] .. "km/h " .. args["{wind}"] .. "\nSky: " .. args["{sky}"] .. "\nHumidity: " .. args["{humid}"] .. "%")
              return args["{tempf}"] .. "°"
          end, 1800, "KGPI")
          --'1800': check every 30 minutes.
          --'EDDN': Nuernberg ICAO code.


-- Keyboard map indicator and changer
-- default keyboard is us, second is german adapt to your needs
--

kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { { "us", "" } }
kbdcfg.current = 1  -- us is our default layout
kbdcfg.widget = wibox.widget.textbox()
kbdcfg.widget.set_align = "right"
kbdcfg.widget:set_text(" " .. kbdcfg.layout[kbdcfg.current][1] .. " ")
kbdcfg.switch = function ()
    kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
    local t = kbdcfg.layout[kbdcfg.current]
    kbdcfg.widget.text = " " .. t[1] .. " "
    os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] )
end

-- Mouse bindings
kbdcfg.widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () kbdcfg.switch() end)
))

-- Create a wibox for each screen and add it
local taglist_buttons = awful.util.table.join(
          awful.button({ }, 1, function(t) t:view_only() end),
          awful.button({ modkey }, 1, function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                  if client.focus then
                                      client.focus:toggle_tag(t)
                                  end
                              end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = awful.util.table.join(
          awful.button({ }, 1, function (c)
                        if c == client.focus then
                            c.minimized = true
                        else
                            -- Without this, the following :isvisible()
                            -- makes no sense
                            c.minimized = false
                            if not c:isvisible() and c.first_tag then
                                c.first_tag:view_only()
                            end
                            -- This will also un-minimise the client, if needed
                            client.focus = c
                            c:raise()
                        end
                    end),
                    awful.button({ }, 3, client_menu_toggle_fn()),
                    awful.button({ }, 4, function ()
                                  awful.client.focus.byidx(1)
                              end),
                    awful.button({ }, 5, function ()
                                  awful.client.focus.byidx(-1)
                              end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
              awful.button({ }, 1, function () awful.layout.inc( 1) end),
              awful.button({ }, 3, function () awful.layout.inc(-1) end),
              awful.button({ }, 4, function () awful.layout.inc( 1) end),
              awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacer, spacer, spacer,
            -- mykeyboardlayout,
            -- wibox.widget.systray(),
            netwidget, spacer, separator,
            volwidget, spacer, separator,
            mytextclock, separator, spacer,

            -- kbdcfg.widget,
            -- spacer,
            -- separator,
            -- spacer,

            mycpuwidget, spacer, separator, spacer,

            myweatherwidget, spacer,
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- Autostart
-- awful.spawn.single_instance("picom -b")
awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey, "Control"}, "h",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey }, "r",
      function()
        awful.util.spawn("dmenu_run -i -nb '#000' -nf '#dd0100' -sb '#225095' -sf '#fac901'")
      end,
      {description = "show the menubar", group = "launcher"}),

    -- This function below will enable ssh login as long as the remote host is
    -- defined in $HOME/.ssh/config else by giving the remote host a name at
    -- the prompt which will also work
    --[[ awful.key({ modkey },           "s",     function ()
                  awful.prompt.run({ prompt = "ssh: " },
                  mypromptbox[mouse.screen].widget,
                  function(h) awful.util.spawn(terminal .. " -e slogin " .. h) end,
                  function(cmd, cur_pos, ncomp)
                      -- Get hosts and hostnames
                      local hosts = {}
                      f = io.popen("sed 's/#.*//;/[ \\t]*Host\\(Name\\)\\?[ \\t]\\+/!d;s///;/[*?]/d' " .. os.getenv("HOME") .. "/.ssh/config | sort")
                      for host in f:lines() do
                          table.insert(hosts, host)
                      end
                      f:close()
                      -- Abort completion under certain circumstances
                      if cur_pos ~= #cmd + 1 and cmd:sub(cur_pos, cur_pos) ~= " " then
                          return cmd, cur_pos
                      end
                      -- A match
                      local matches = {}
                      table.foreach(hosts, function(x)
                          if hosts[x]:find("^" .. cmd:sub(1, cur_pos):gsub('[-]', '[-]')) then
                              table.insert(matches, hosts[x])
                          end
                      end)
                      -- If there are no matches
                      if #matches == 0 then
                          return cmd, cur_pos
                      end
                      -- Cycle
                      while ncomp > #matches do
                          ncomp = ncomp - #matches
                      end
                      -- Return the match and position
                      return matches[ncomp], #matches[ncomp] + 1
                  end,
                  awful.util.getdir("cache") .. "ssh_history")
              end,
              {description = "ssh login", group = "awesome"}), ]]

    awful.key({ modkey }, "e",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

    -- Applications
    awful.key({ modkey }, "a",
      function()
        awful.util.spawn("audacious")
      end,
      {description = "audacious", group = "launcher"}
    ),

    awful.key({ modkey }, "b",
      function()
        awful.util.spawn("brave-browser")
      end,
      {description = "brave", group = "launcher"}
    ),

    awful.key({ modkey }, "d",
      function()
        awful.util.spawn("transmission-gtk")
      end,
      {description = "transmission", group = "launcher"}
    ),

    awful.key({ modkey }, "x",
      function()
        awful.util.spawn("keepassxc")
      end,
      {description = "keepass", group = "launcher"}
    ),

    awful.key({ modkey }, "s",
      function()
        awful.util.spawn("steam")
      end,
      {description = "steam", group = "launcher"}
    ),

    -- Hotkeys
    awful.key(
      {},
      'XF86AudioRaiseVolume',
      function()
        exec("pactl set-sink-volume @DEFAULT_SINK@ +5%", false) vicious.force({volbar, volwidget})
      end,
      {description = 'volume up', group = 'hotkeys'}
    ),
    awful.key(
      { modkey, "Control" },
      '=',
      function()
        exec("pactl set-sink-volume @DEFAULT_SINK@ +5%", false) vicious.force({volbar, volwidget})
      end,
      {description = 'volume up', group = 'hotkeys'}
    ),
    awful.key(
      {},
      'XF86AudioLowerVolume',
      function()
        exec("pactl set-sink-volume @DEFAULT_SINK@ -5%", false) vicious.force({volbar, volwidget})
      end,
      {description = 'volume down', group = 'hotkeys'}
    ),
    awful.key(
      { modkey, "Control" },
      '-',
      function()
        exec("pactl set-sink-volume @DEFAULT_SINK@ -5%", false) vicious.force({volbar, volwidget})
      end,
      {description = 'volume down', group = 'hotkeys'}
    ),
    awful.key(
      {},
      'XF86AudioMute',
      function()
        exec("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) vicious.force({volbar, volwidget})
      end,
      {description = 'volume toggle', group = 'hotkeys'}
    ),
    awful.key(
      { modkey, "Control" },
      '0',
      function()
        exec("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) vicious.force({volbar, volwidget})
      end,
      {description = 'volume toggle', group = 'hotkeys'}
    ),
    awful.key(
      { },
      'Print',
      nil,
      function()
        awful.spawn("scrot -s '/home/flux/Storage/photoArchive/caps/%Y-%m-%d.png'")
      end,
      {description = 'screenshot', group = 'hotkeys'}
    ),
    awful.key(
      { modkey },
      'Up',
      function()
        awful.spawn("slock")
      end,
      {description = 'lock screen', group = 'hotkeys'}
    )
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          -- To fix Flash fullscreen issues if still seeing bottom bar
          -- For chromium change "plugin-container" to "exe"
          "plugin-container",
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = awful.util.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Run garbage collector regularly to prevent memory leaks
gears.timer {
       timeout = 30,
       autostart = true,
       callback = function() collectgarbage() end
}