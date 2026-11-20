-- ============================================================================
-- Bind helper
-- ============================================================================

local function bind(keys, dispatcher, description, options)
    options = options or {}
    options.description = description
    hl.bind(keys, dispatcher, options)
end


-- ============================================================================
-- Window controls
-- ============================================================================

-- Move focus
bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }), "Focus window left")
bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }), "Focus window down")
bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }), "Focus window up")
bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }), "Focus window right")

-- Move window
bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }), "Move window left")
bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }), "Move window down")
bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }), "Move window up")
bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }), "Move window right")

-- Resize window
bind(
    mainMod .. " + CTRL + h",
    hl.dsp.window.resize({ x = -30, y = 0 }),
    "Shrink window horizontally",
    { repeating = true }
)

bind(
    mainMod .. " + CTRL + j",
    hl.dsp.window.resize({ x = 0, y = 30 }),
    "Grow window downward",
    { repeating = true }
)

bind(
    mainMod .. " + CTRL + k",
    hl.dsp.window.resize({ x = 0, y = -30 }),
    "Shrink window vertically",
    { repeating = true }
)

bind(
    mainMod .. " + CTRL + l",
    hl.dsp.window.resize({ x = 30, y = 0 }),
    "Grow window horizontally",
    { repeating = true }
)

-- Mouse move / resize
bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    "Move window with mouse",
    { mouse = true }
)

bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    "Resize window with mouse",
    { mouse = true }
)

-- Window state
bind(mainMod .. " + Q", hl.dsp.window.close(), "Close active window")
bind("ALT + F4", hl.dsp.window.kill(), "Force-kill active window")
bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), "Toggle floating window")
bind(mainMod .. " + SHIFT + G", hl.dsp.group.toggle(), "Toggle window group")
bind("ALT + return", hl.dsp.window.fullscreen(), "Toggle fullscreen")


-- ============================================================================
-- Hardware / media keys
-- ============================================================================

bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 2%-"),
    "Decrease screen brightness",
    { repeating = true }
)

bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +2%"),
    "Increase screen brightness",
    { repeating = true }
)

bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pamixer -d 2"),
    "Lower volume",
    { repeating = true }
)

bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pamixer -i 2"),
    "Raise volume",
    { repeating = true }
)

bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend"), "Suspend system")
bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"), "Toggle microphone mute")
bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), "Toggle audio mute")
bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), "Play or pause media")
bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), "Play or pause media")
bind("xf86AudioNext", hl.dsp.exec_cmd("playerctl next"), "Next media track")
bind("xf86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), "Previous media track")


-- ============================================================================
-- Application shortcuts
-- ============================================================================

bind(mainMod .. " + Return", hl.dsp.exec_cmd(term), "Launch terminal")
bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManagerScript .. " " .. fileManager),
    "Launch file manager"
)
bind(mainMod .. " + C", hl.dsp.exec_cmd(editor), "Launch editor")
bind(mainMod .. " + F", hl.dsp.exec_cmd(browser), "Launch browser")


-- ============================================================================
-- Launcher / desktop tools
-- ============================================================================

-- Main launcher
bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd(launcher .. " drun"),
    "Open application launcher"
)

-- Launcher modes
bind(
    mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd(launcher .. " wallpaper"),
    "Open wallpaper picker"
)

bind(
    mainMod .. " + Z",
    hl.dsp.exec_cmd(launcher .. " emoji"),
    "Open emoji picker"
)

bind(
    mainMod .. " + SHIFT + T",
    hl.dsp.exec_cmd(launcher .. " tmux"),
    "Open tmux session picker"
)

bind(
    mainMod .. " + G",
    hl.dsp.exec_cmd(launcher .. " games"),
    "Open game launcher"
)

-- Panels / desktop utilities
bind(
    mainMod .. " + SHIFT + A",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle control-center audio || pavucontrol"
    ),
    "Open audio controls"
)

bind(
    mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle control-center media"
    ),
    "Open media controls"
)

bind(
    mainMod .. " + SHIFT + N",
    hl.dsp.exec_cmd("swaync-client -t -sw"),
    "Toggle notification panel"
)

bind(
    mainMod .. " + ALT + G",
    hl.dsp.exec_cmd(gamemode),
    "Toggle game mode"
)

bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(clipmanager),
    "Open clipboard manager"
)


-- ============================================================================
-- System utilities
-- ============================================================================

bind(
    "CONTROL + ALT + DELETE",
    hl.dsp.exec_cmd(term .. " -e btop"),
    "Open system monitor"
)

bind(
    "CONTROL + ALT + M",
    hl.dsp.exec_cmd(
        term .. ' --class "microfetch" --hold -e microfetch'
    ),
    "Show system information"
)

bind(
    mainMod .. " + CTRL + C",
    hl.dsp.exec_cmd("hyprpicker --autocopy --format=hex"),
    "Pick colour from screen"
)

-- Keybind help
bind(mainMod .. " + question", hl.dsp.exec_cmd(keybinds_yad), "Show keybind help")
bind(mainMod .. " + slash", hl.dsp.exec_cmd(keybinds_yad), "Show keybind help")

-- Auto-clicker
bind(
    mainMod .. " + F8",
    hl.dsp.exec_cmd(
        "kill $(cat /tmp/auto-clicker.pid) 2>/dev/null || "
            .. autoclicker
            .. " --cps 40"
    ),
    "Toggle auto-clicker"
)


-- ============================================================================
-- Night mode
-- ============================================================================

-- Lower temperatures are warmer: 3500, 3000, 2500
bind(
    mainMod .. " + F9",
    hl.dsp.exec_cmd("hyprsunset --temperature 2500"),
    "Enable night mode"
)

bind(
    mainMod .. " + F10",
    hl.dsp.exec_cmd("pkill hyprsunset"),
    "Disable night mode"
)


-- ============================================================================
-- Session actions
-- ============================================================================

bind(
    mainMod .. " + ALT + L",
    hl.dsp.exec_cmd("noctalia msg session lock || hyprlock"),
    "Lock session"
)

bind(
    mainMod .. " + backspace",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle session || pkill -x wlogout || wlogout -b 4"
    ),
    "Open session menu"
)

-- Toggle bar
bind(
    "CONTROL + ESCAPE",
    hl.dsp.exec_cmd(
        'pkill "waybar|noctalia|wayle|.quickshell" || ' .. bar
    ),
    "Toggle desktop bar"
)

-- Zoom
bind(
    mainMod .. " + CTRL + mouse_down",
    hl.dsp.exec_cmd(zoom .. " in"),
    "Zoom in"
)

bind(
    mainMod .. " + CTRL + mouse_up",
    hl.dsp.exec_cmd(zoom .. " out"),
    "Zoom out"
)


-- ============================================================================
-- Screenshots / screen recording
-- ============================================================================

bind(
    mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd(screen_record .. " a"),
    "Record selected area"
)

bind(
    mainMod .. " + CTRL + R",
    hl.dsp.exec_cmd(screen_record .. " m"),
    "Record current monitor"
)

bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd(screenshot .. " s"),
    "Screenshot selected area"
)

bind(
    mainMod .. " + CTRL + P",
    hl.dsp.exec_cmd(screenshot .. " sf"),
    "Screenshot frozen screen"
)

bind(
    mainMod .. " + print",
    hl.dsp.exec_cmd(screenshot .. " m"),
    "Screenshot current monitor"
)

bind(
    mainMod .. " + ALT + P",
    hl.dsp.exec_cmd(screenshot .. " p"),
    "Screenshot all monitors"
)


-- ============================================================================
-- Workspace controls
-- ============================================================================

-- Cycle floating windows
bind(
    mainMod .. " + Tab",
    hl.dsp.window.cycle_next(),
    "Cycle to next window"
)

bind(
    mainMod .. " + Tab",
    hl.dsp.exec_cmd("hyprctl dispatch bringactivetotop"),
    "Raise active window"
)

-- Switch relative to the active workspace
bind(
    mainMod .. " + CTRL + right",
    hl.dsp.focus({ workspace = "r+1" }),
    "Switch to next workspace"
)

bind(
    mainMod .. " + CTRL + left",
    hl.dsp.focus({ workspace = "r-1" }),
    "Switch to previous workspace"
)

-- Jump to the first empty workspace
bind(
    mainMod .. " + CTRL + down",
    hl.dsp.focus({ workspace = "empty" }),
    "Switch to first empty workspace"
)

-- Scroll through existing workspaces
bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }),
    "Scroll to next existing workspace"
)

bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }),
    "Scroll to previous existing workspace"
)

-- Move active window to a relative workspace
bind(
    mainMod .. " + CTRL + ALT + right",
    hl.dsp.window.move({ workspace = "r+1" }),
    "Move window to next workspace"
)

bind(
    mainMod .. " + CTRL + ALT + left",
    hl.dsp.window.move({ workspace = "r-1" }),
    "Move window to previous workspace"
)

-- Arrow-key window movement within the current workspace
bind(
    mainMod .. " + SHIFT + CTRL + left",
    hl.dsp.window.move({ direction = "l" }),
    "Move window left"
)

bind(
    mainMod .. " + SHIFT + CTRL + right",
    hl.dsp.window.move({ direction = "r" }),
    "Move window right"
)

bind(
    mainMod .. " + SHIFT + CTRL + up",
    hl.dsp.window.move({ direction = "u" }),
    "Move window up"
)

bind(
    mainMod .. " + SHIFT + CTRL + down",
    hl.dsp.window.move({ direction = "d" }),
    "Move window down"
)


-- ============================================================================
-- Special workspace / scratchpad
-- ============================================================================

-- Show / hide scratchpad
bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("special"),
    "Toggle scratchpad"
)

-- Send active window to scratchpad without following
bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special",
        follow = false,
    }),
    "Send window to scratchpad"
)


-- ============================================================================
-- Scrolling layout
-- ============================================================================

bind(
    mainMod .. " + period",
    hl.dsp.exec_cmd("hyprctl dispatch layoutmsg move +col"),
    "Move to next scrolling column"
)

bind(
    mainMod .. " + comma",
    hl.dsp.exec_cmd("hyprctl dispatch layoutmsg move -col"),
    "Move to previous scrolling column"
)


-- ============================================================================
-- NixOS rebuild
-- ============================================================================

bind(
    mainMod .. " + U",
    hl.dsp.exec_cmd(term .. " -e rebuild"),
    "Rebuild NixOS"
)


-- ============================================================================
-- Workspaces 1-10
-- ============================================================================

for i = 1, 10 do
    local key = i % 10

    -- Focus workspace
    bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }),
        "Focus workspace " .. i
    )

    -- Move window to workspace and follow
    bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }),
        "Move window to workspace " .. i
    )

    -- Move window without following
    bind(
        mainMod .. " + CTRL + " .. key,
        hl.dsp.window.move({
            workspace = i,
            follow = false,
        }),
        "Send window to workspace " .. i
    )
end
