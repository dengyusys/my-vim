# 导入配置工具模块
Import-Module "$PSScriptRoot\ConfigUtils.psm1" -Force

# 复制.vimrc文件
Copy-ConfigFile -sourcePath (Join-Path -Path $HOME -ChildPath ".vimrc") -destinationFolder $PWD

# 复制.wezterm.lua文件
Copy-ConfigFile -sourcePath (Join-Path -Path $HOME -ChildPath ".wezterm.lua") -destinationFolder $PWD
