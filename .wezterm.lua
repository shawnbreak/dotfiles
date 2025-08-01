-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local os = os.getenv("os")
if os ~= nil and string.match(os, "Windows*") then
  print("current os is " .. os)
  config.default_prog = { "pwsh.exe", "--nologo" }
end


-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.tab_max_width = 20
config.window_background_opacity = 0.9
config.scrollback_lines = 3500
config.window_decorations = "TITLE | RESIZE" -- "TITLE | RESIZE", "RESIZE", "TITLE", "NONE"
config.color_scheme = 'Monokai (dark) (terminal.sexy)'
config.font = wezterm.font {
  -- family = 'FiraCode Nerd Font',
  -- family = '3270 Nerd Font',
  family = 'JetBrainsMono Nerd Font',
  -- family = 'BigBlueTerm437 Nerd Font',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- disalbe ligature
}
config.font_size = 14
config.initial_rows = 35
config.initial_cols = 140

config.window_background_image = '/Users/shawn/wezterm-config/backdrops/5-cm.jpg'
config.window_background_image_hsb = {
    brightness = 0.06,
    hue = 1.0,
    saturation = 1.0
}

-- launch menu
local launch_menu = {}
for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
  table.insert(
    launch_menu,
    {
      label = "💻(SSH)  " .. config["hostname"] .. " (" .. config["user"] .. ")",
      args = { "ssh", host }
    }
  )
end
config.launch_menu = launch_menu


-- mouse binding
local mouse_bindings = {
  -- 右键粘贴
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action { PasteFrom = "Clipboard" }
  },
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action { CompleteSelection = "PrimarySelection" }
  },
  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = "OpenLinkAtMouseCursor"
  }
}
config.mouse_bindings = mouse_bindings

-- window padding
config.window_padding = {
  left = "0cell",
  right = "0cell",
  top = "0.5cell",
  bottom = "0cell",
}

local function resize_window(delta_w, delta_h)
  return function(window, pane)
    local dims = window:get_dimensions()
    local new_width = dims.pixel_width + delta_w
    local new_height = dims.pixel_height + delta_h
    window:set_inner_size(new_width, new_height)
  end
end

config.keys = {
  { key = 'l',  mods = 'ALT',      action = wezterm.action.ShowLauncher },
  { key = 'F9', mods = 'ALT',      action = wezterm.action.ShowTabNavigator },
  { key = '9',  mods = 'ALT',      action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
  { key = 'n',  mods = 'CTRL|ALT', action = wezterm.action.SwitchWorkspaceRelative(1) },
  { key = 'p',  mods = 'CTRL|ALT', action = wezterm.action.SwitchWorkspaceRelative(-1) },
 -- 窗口变宽（右）
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(resize_window(50, 0)),
    },
    -- 窗口变窄（左）
    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(resize_window(-50, 0)),
    },
    -- 窗口变高（下）
    {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(resize_window(0, 30)),
    },
    -- 窗口变矮（上）
    {
      key = 'UpArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(resize_window(0, -30)),
    },
}

wezterm.on('gui-startup', function(cmd) -- set startup Window position
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {
    position = { x = 60, y = 60 }
  })
  -- window:gui_window():set_position(50, -50)
end)
-- and finally, return the configuration to wezterm
return config
