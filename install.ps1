# 导入配置工具模块
Import-Module "$PSScriptRoot\ConfigUtils.psm1" -Force

# 复制.vimrc文件
Copy-ConfigFile -sourcePath (Join-Path -Path $PWD -ChildPath ".vimrc") -destinationFolder $HOME

# 复制.wezterm.lua文件
Copy-ConfigFile -sourcePath (Join-Path -Path $PWD -ChildPath ".wezterm.lua") -destinationFolder $HOME
