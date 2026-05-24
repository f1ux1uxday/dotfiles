-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- hl.window_rule({
--     name  = "suppress-maximize",
--     match = { class = ".*" },
--     suppress_event = "maximize",
-- })

-- hl.window_rule({
--     name  = "fix-xwayland-drags",
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })

-- hl.window_rule({
--     name  = "steam-float",
--     match = { class = "^(steam)$", title = "^(Steam)$" },
--     float = true,
-- })

-- hl.window_rule({
--     name  = "zen-pip",
--     match = { class = "^(zen)$", title = "^(Picture-in-Picture)$" },
--     float = true,
-- })

-- hl.window_rule({
--     name  = "zen-opacity",
--     match = { initial_class = "^(zen)" },
--     opacity = 1.0,
-- })
