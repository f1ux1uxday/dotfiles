------------------------------------------------------------
-- openSUSE awesome theme based on awesome default theme --
------------------------------------------------------------
palette = {
   bg = "#282A36",
   fg = "#F8F8F2",
   selection = "#44475A",
   comment = "#6272A4",
   red = "#FF5555",
   orange = "#FFB86C",
   yellow = "#F1FA8C",
   green = "#50fa7b",
   purple = "#BD93F9",
   cyan = "#8BE9FD",
   pink = "#FF79C6",
   bright_red = "#FF6E6E",
   bright_green = "#69FF94",
   bright_yellow = "#FFFFA5",
   bright_blue = "#D6ACFF",
   bright_magenta = "#FF92DF",
   bright_cyan = "#A4FFFF",
   bright_white = "#FFFFFF",
   menu = "#21222C",
   visual = "#3E4452",
   gutter_fg = "#4B5263",
   nontext = "#3B4048",
   white = "#ABB2BF",
   black = "#191A21",
}

theme = {}

theme.font          = "FantasqueSansM Nerd Font Bold 9"

theme.bg_normal     = palette.bg
theme.bg_focus      = palette.bg
theme.bg_urgent     = palette.bg
theme.bg_minimize   = palette.bg
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = palette.green
theme.fg_focus      = palette.pink
theme.fg_urgent     = palette.red
theme.fg_minimize   = palette.purple

theme.border_width  = 2
theme.border_normal = palette.purple
theme.border_focus  = palette.pink
theme.border_marked = palette.red

theme.taglist_bg_focus = palette.pink
theme.taglist_fg_focus = palette.bg
theme.taglist_bg_occupied = palette.bg
theme.taglist_fg_occupied = palette.purple
theme.taglist_fg_empty = palette.yellow

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"
theme.master_width_factor = 0.62
theme.useless_gap = 3

theme.widget_separator  = palette.gutter_fg

theme.fg_netdn_widget  = palette.cyan
theme.fg_netup_widget  = palette.orange

-- Display the taglist squares
-- theme.taglist_squares_sel   = "/usr/share/awesome/themes/openSUSE/taglist/squarefw.png"
-- theme.taglist_squares_sel   = "~/.icons/dracula-icons-main/16/actions/draw-triangle4.svg"
-- theme.taglist_squares_unsel = "/usr/share/awesome/themes/openSUSE/taglist/squarew.png"
-- theme.taglist_squares_unsel   = "~/.icons/dracula-icons-main/16/actions/draw-triangle3.svg"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = "/usr/share/awesome/themes/openSUSE/submenu.png"
theme.menu_submenu_icon = "~/.local/share/icons/dracula-icons-main/16/actions/draw-arrow-forward.svg"
theme.menu_height = 15
theme.menu_width  = 200

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/openSUSE/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/openSUSE/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/openSUSE/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/openSUSE/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/Pictures/opensuse.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/usr/share/awesome/themes/openSUSE/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/openSUSE/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/openSUSE/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/openSUSE/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/openSUSE/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/openSUSE/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/openSUSE/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/openSUSE/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/openSUSE/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/openSUSE/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/openSUSE/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/openSUSE/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"
-- theme.opensuse_icon = "~/.icons/OieOxy tchalla/scalable/apps/cinnamon-preferences-color.svg"
theme.opensuse_icon = "/home/flux/.icons/Dracula/Places/16/user-home.svg"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
