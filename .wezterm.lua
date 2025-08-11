-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- 设置使用shell
config.default_prog = { 'C:/Program Files/PowerShell/7/pwsh.exe', '-NoLogo' }

-- 设置字体
-- config.font = wezterm.font({ family = "JetBrainsMonoNL Nerd Font Mono" })

config.font = wezterm.font({ family = "Consolas" })

-- 取消连字
config.harfbuzz_features = { 'calt = 0', 'clig = 0', 'liga = 0' }

-- 配色
config.color_scheme = "Tokyo Night"

-- 亚克力效果
config.window_background_opacity = 0.3
config.win32_system_backdrop = 'Acrylic'

-- anm finally, return the configuration to wezterm
return config
