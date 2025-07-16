-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- 设置使用shell
config.default_prog = { 'C:/Program Files/PowerShell/7/pwsh.exe' }

-- 取消连字
config.harfbuzz_features = { 'calt = 0', 'clig = 0', 'liga = 0' }

-- 配色
config.color_scheme = "Apple Classic"

-- 亚克力效果
config.window_background_opacity = 0.8
config.win32_system_backdrop = 'Acrylic'

-- and finally, return the configuration to wezterm
return config
