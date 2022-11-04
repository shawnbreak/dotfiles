local wezterm = require 'wezterm'

-- default prog
local defaut_prog = nil
local os = os.getenv("os")
if os ~= nil and string.match(os, "Windows*") then
  print("current os is " .. os)
  defaut_prog = {"pwsh.exe", "--nologo"}
end

-- launch menu
local launch_menu = {}
for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
  table.insert(
    launch_menu,
    {
        label = "💻(SSH)  " .. config["hostname"] .. " (" .. config["user"] .. ")",
        args = {"ssh", host}
    }
  )
end

-- mouse binding
local mouse_bindings = {
    -- 右键粘贴
    {
        event = {Down = {streak = 1, button = "Right"}},
        mods = "NONE",
        action = wezterm.action {PasteFrom = "Clipboard"}
    },
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = {Up = {streak = 1, button = "Left"}},
        mods = "NONE",
        action = wezterm.action {CompleteSelection = "PrimarySelection"}
    },
    -- and make CTRL-Click open hyperlinks
    {
        event = {Up = {streak = 1, button = "Left"}},
        mods = "CTRL",
        action = "OpenLinkAtMouseCursor"
    }
}

-- window padding
local window_padding = {
    left = '1.2cell',
    right = '0.5cell',
    top = '0.5cell',
    bottom = '0.5cell',
}

local key_bindings = {
    { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
    { key = 'F9', mods = 'ALT', action = wezterm.action.ShowTabNavigator },
    { key = '9', mods = 'ALT', action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
    { key = 'n', mods = 'CTRL|ALT', action = wezterm.action.SwitchWorkspaceRelative(1) },
    { key = 'p', mods = 'CTRL|ALT', action = wezterm.action.SwitchWorkspaceRelative(-1) },
}

-- startup event
-- local mux = wezterm.mux
-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():set_inner_size(1000, 600)
-- end)

return {

  use_fancy_tab_bar = true,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = false,
  tab_max_width = 20,
  window_background_opacity = 0.8,
  scrollback_lines = 3500,
  window_decorations = "RESIZE", -- "TITLE | RESIZE", "RESIZE", "TITLE", "NONE"
  color_scheme='Dracula',

  default_prog = defaut_prog,
  mouse_bindings = mouse_bindings,
  window_padding = window_padding,
  launch_menu = launch_menu,
  keys = key_bindings,

}
