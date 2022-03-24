------------------------------------------------------------
-- openSUSE awesome theme based on awesome default theme --
------------------------------------------------------------

theme = {}

theme.font          = "Public Sans SemiBold 9"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#225095"
theme.bg_urgent     = "#dd0100"
theme.bg_minimize   = "#fac901"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#fac901"
theme.fg_focus      = "#fac901"
theme.fg_urgent     = "#fac901"
theme.fg_minimize   = "#225095"

theme.border_width  = 4
theme.border_normal = "#000000"
theme.border_focus  = "#dd0100"
theme.border_marked = "#91231c"

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

theme.fg_netdn_widget  = "#225095"
theme.fg_netup_widget  = "#dd0100"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/openSUSE/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/openSUSE/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/openSUSE/submenu.png"
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

-- theme.wallpaper = "/usr/share/wallpapers/openSUSEdefault/contents/images/1920x1080.jpg"
theme.wallpaper = "~/Pictures/piet-mondrian-wallpaper.jpg"

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
theme.opensuse_icon = "~/.local/share/icons/Mondrian/places/48/desktop.svg"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
