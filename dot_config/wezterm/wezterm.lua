local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14
config.use_fancy_tab_bar = true
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_frame = { font_size = 13 }

local function move_or_resize(resize_or_move, key)
    local direction = { h = 'Left', j = 'Down', k = 'Up', l = 'Right' }
    return {
        key = key,
        mods = resize_or_move == 'resize' and 'META' or 'CMD',
        action = wezterm.action_callback(function(win, pane)
            if pane:get_user_vars().IS_NVIM == 'true' then
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
                }, pane)
            else
                if resize_or_move == 'resize' then
                    win:perform_action({ AdjustPaneSize = { direction[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction[key] }, pane)
                end
            end
        end),
    }
end

local function rename_tab()
    return wezterm.action.PromptInputLine {
        description = 'Enter new tab name',
        action = wezterm.action_callback(function(window, _, line)
            if line then
                window:active_tab():set_title(line)
            end
        end)
    }
end

config.leader = { mods = 'CTRL', key = 's' }
config.keys = {
    -- Panes
    { mods = 'LEADER', key = ',',     action = rename_tab() },
    { mods = 'LEADER', key = 'm',     action = wezterm.action.TogglePaneZoomState },
    { mods = "LEADER", key = "Space", action = wezterm.action.RotatePanes "Clockwise" },
    { mods = 'LEADER', key = '0',     action = wezterm.action.PaneSelect { mode = 'SwapWithActive' } },
    { mods = 'LEADER', key = 'v',     action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { mods = 'LEADER', key = 's',     action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- Reload config
    { mods = 'LEADER', key = 'r',     action = wezterm.action.ReloadConfiguration },

    -- Move between split panes
    move_or_resize('move', 'h'),
    move_or_resize('move', 'j'),
    move_or_resize('move', 'k'),
    move_or_resize('move', 'l'),
    move_or_resize('move', '\\'),

    -- Resize panes
    move_or_resize('resize', 'h'),
    move_or_resize('resize', 'j'),
    move_or_resize('resize', 'k'),
    move_or_resize('resize', 'l'),
}

-- Set powershell core on windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'pwsh', '-NoLogo' }
end

return config
