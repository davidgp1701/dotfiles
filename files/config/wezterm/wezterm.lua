local wezterm = require("wezterm")
local config = {}

-- It helps to provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Macchiato"

-- Dissable tabbar
config.enable_tab_bar = false

-- Font
-- config.font = wezterm.font 'FiraCode Nerd Font'
-- config.font = wezterm.font 'Hack Nerd Font'

return config
