-- ============================================================================
-- Window controls
-- ============================================================================

-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))

-- Resize window
hl.bind(
    mainMod .. " + CTRL + h",
    hl.dsp.window.resize({ x = -30, y = 0 }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + CTRL + j",
    hl.dsp.window.resize({ x = 0, y = 30 }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + CTRL + k",
    hl.dsp.window.resize({ x = 0, y = -30 }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + CTRL + l",
    hl.dsp.window.resize({ x = 30, y = 0 }),
    { repeating = true }
)

-- Mouse move / resize
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Window state
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("ALT + F4", hl.dsp.window.kill())
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.toggle())
hl.bind("ALT + return", hl.dsp.window.fullscreen())


-- ============================================================================
-- Hardware / media keys
-- ============================================================================

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 2%-"),
    { repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +2%"),
    { repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pamixer -d 2"),
    { repeating = true }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pamixer -i 2"),
    { repeating = true }
)

hl.bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("xf86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))


-- ============================================================================
-- Application shortcuts
-- ============================================================================

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManagerScript .. " " .. fileManager)
)
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))


-- ============================================================================
-- Launcher / desktop tools
-- ============================================================================

-- Main launcher
hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd(launcher .. " drun")
)

-- Launcher modes
hl.bind(
    mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd(launcher .. " wallpaper")
)

hl.bind(
    mainMod .. " + Z",
    hl.dsp.exec_cmd(launcher .. " emoji")
)

hl.bind(
    mainMod .. " + SHIFT + T",
    hl.dsp.exec_cmd(launcher .. " tmux")
)

hl.bind(
    mainMod .. " + G",
    hl.dsp.exec_cmd(launcher .. " games")
)

-- Panels / desktop utilities
hl.bind(
    mainMod .. " + SHIFT + A",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle control-center audio || pavucontrol"
    )
)

hl.bind(
    mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle control-center media"
    )
)

hl.bind(
    mainMod .. " + SHIFT + N",
    hl.dsp.exec_cmd("swaync-client -t -sw")
)

hl.bind(
    mainMod .. " + ALT + G",
    hl.dsp.exec_cmd(gamemode)
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(clipmanager)
)


-- ============================================================================
-- System utilities
-- ============================================================================

hl.bind(
    "CONTROL + ALT + DELETE",
    hl.dsp.exec_cmd(term .. " -e btop")
)

hl.bind(
    "CONTROL + ALT + M",
    hl.dsp.exec_cmd(
        term .. ' --class "microfetch" --hold -e microfetch'
    )
)

hl.bind(
    mainMod .. " + CTRL + C",
    hl.dsp.exec_cmd("hyprpicker --autocopy --format=hex")
)

-- Keybind help
hl.bind(mainMod .. " + question", hl.dsp.exec_cmd(keybinds_yad))
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd(keybinds_yad))

-- Auto-clicker
hl.bind(
    mainMod .. " + F8",
    hl.dsp.exec_cmd(
        "kill $(cat /tmp/auto-clicker.pid) 2>/dev/null || "
            .. autoclicker
            .. " --cps 40"
    )
)


-- ============================================================================
-- Night mode
-- ============================================================================

-- Lower temperatures are warmer: 3500, 3000, 2500
hl.bind(
    mainMod .. " + F9",
    hl.dsp.exec_cmd("hyprsunset --temperature 2500")
)

hl.bind(
    mainMod .. " + F10",
    hl.dsp.exec_cmd("pkill hyprsunset")
)


-- ============================================================================
-- Session actions
-- ============================================================================

hl.bind(
    mainMod .. " + ALT + L",
    hl.dsp.exec_cmd("noctalia msg session lock || hyprlock")
)

hl.bind(
    mainMod .. " + backspace",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle session || pkill -x wlogout || wlogout -b 4"
    )
)

-- Toggle bar
hl.bind(
    "CONTROL + ESCAPE",
    hl.dsp.exec_cmd(
        'pkill "waybar|noctalia|wayle|.quickshell" || ' .. bar
    )
)

-- Zoom
hl.bind(
    mainMod .. " + CTRL + mouse_down",
    hl.dsp.exec_cmd(zoom .. " in")
)

hl.bind(
    mainMod .. " + CTRL + mouse_up",
    hl.dsp.exec_cmd(zoom .. " out")
)


-- ============================================================================
-- Screenshots / screen recording
-- ============================================================================

hl.bind(
    mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd(screen_record .. " a")
)

hl.bind(
    mainMod .. " + CTRL + R",
    hl.dsp.exec_cmd(screen_record .. " m")
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd(screenshot .. " s")
)

hl.bind(
    mainMod .. " + CTRL + P",
    hl.dsp.exec_cmd(screenshot .. " sf")
)

hl.bind(
    mainMod .. " + print",
    hl.dsp.exec_cmd(screenshot .. " m")
)

hl.bind(
    mainMod .. " + ALT + P",
    hl.dsp.exec_cmd(screenshot .. " p")
)


-- ============================================================================
-- Workspace controls
-- ============================================================================

-- Cycle floating windows
hl.bind(
    mainMod .. " + Tab",
    hl.dsp.window.cycle_next()
)

hl.bind(
    mainMod .. " + Tab",
    hl.dsp.exec_cmd("hyprctl dispatch bringactivetotop")
)

-- Switch relative to the active workspace
hl.bind(
    mainMod .. " + CTRL + right",
    hl.dsp.focus({ workspace = "r+1" })
)

hl.bind(
    mainMod .. " + CTRL + left",
    hl.dsp.focus({ workspace = "r-1" })
)

-- Jump to the first empty workspace
hl.bind(
    mainMod .. " + CTRL + down",
    hl.dsp.focus({ workspace = "empty" })
)

-- Scroll through existing workspaces
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Move active window to a relative workspace
hl.bind(
    mainMod .. " + CTRL + ALT + right",
    hl.dsp.window.move({ workspace = "r+1" })
)

hl.bind(
    mainMod .. " + CTRL + ALT + left",
    hl.dsp.window.move({ workspace = "r-1" })
)

-- Arrow-key window movement within the current workspace
hl.bind(
    mainMod .. " + SHIFT + CTRL + left",
    hl.dsp.window.move({ direction = "l" })
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + right",
    hl.dsp.window.move({ direction = "r" })
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + up",
    hl.dsp.window.move({ direction = "u" })
)

hl.bind(
    mainMod .. " + SHIFT + CTRL + down",
    hl.dsp.window.move({ direction = "d" })
)


-- ============================================================================
-- Special workspace / scratchpad
-- ============================================================================

-- Show / hide scratchpad
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("special")
)

-- Send active window to scratchpad without following
hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special",
        follow = false,
    })
)


-- ============================================================================
-- Scrolling layout
-- ============================================================================

hl.bind(
    mainMod .. " + period",
    hl.dsp.exec_cmd("hyprctl dispatch layoutmsg move +col")
)

hl.bind(
    mainMod .. " + comma",
    hl.dsp.exec_cmd("hyprctl dispatch layoutmsg move -col")
)


-- ============================================================================
-- NixOS rebuild
-- ============================================================================

hl.bind(
    mainMod .. " + U",
    hl.dsp.exec_cmd(term .. " -e rebuild")
)


-- ============================================================================
-- Workspaces 1-10
-- ============================================================================

for i = 1, 10 do
    local key = i % 10

    -- Focus workspace
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    -- Move window to workspace and follow
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )

    -- Move window without following
    hl.bind(
        mainMod .. " + CTRL + " .. key,
        hl.dsp.window.move({
            workspace = i,
            follow = false,
        })
    )
end
