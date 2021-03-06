---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "profont 9"

theme.bg_normal     = "#111111"
theme.bg_focus      = "#111111"
theme.bg_urgent     = "#000000"
theme.bg_minimize   = "#000000"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#7C875F"
theme.fg_focus      = "#b5bd68"
theme.fg_urgent     = "#F0C674"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 2
theme.border_normal = "#2c2c2c"
theme.border_focus  = "#8C9440"
theme.border_marked = "#000000"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/finiks/.config/awesome/themes/clover/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/finiks/.config/awesome/themes/clover/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/finiks/.config/awesome/themes/default/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/finiks/.config/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/finiks/.config/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/finiks/.config/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/finiks/.config/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/finiks/.config/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/finiks/.config/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/finiks/.config/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/finiks/.config/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/finiks/.config/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/finiks/.config/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/finiks/.config/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/finiks/.config/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/finiks/.config/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/finiks/.config/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/finiks/.config/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/finiks/.config/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/finiks/.config/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/finiks/.config/awesome/themes/default/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/finiks/pictures/wall_cirno.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/finiks/.config/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/home/finiks/.config/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating  = "/home/finiks/.config/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/home/finiks/.config/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/home/finiks/.config/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/home/finiks/.config/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/finiks/.config/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/finiks/.config/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/home/finiks/.config/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/home/finiks/.config/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral  = "/home/finiks/.config/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/home/finiks/.config/awesome/themes/default/layouts/dwindlew.png"

theme.awesome_icon = "/home/finiks/.config/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /home/finiks/.config/icons and /home/finiks/.config/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
