local wezterm = require 'wezterm'

return {
  font_size = 20.0,

  use_fancy_tab_bar = false,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,

  keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    { key = 'm', mods = 'CMD', action = 'DisableDefaultAssignment' },
    { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
  },
}
