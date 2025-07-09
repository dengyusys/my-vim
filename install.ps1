# 获取当前目录下的.vimrc文件
$sourceFile = Join-Path -Path $PWD -ChildPath ".vimrc"

# 设置目标文件路径（用户主目录下的.vimrc）
$destinationFile = Join-Path -Path $HOME -ChildPath ".vimrc"

# 复制文件，如果目标文件已存在则覆盖
Copy-Item -Path $sourceFile -Destination $destinationFile -Force

# 输出操作结果
if (Test-Path -Path $destinationFile) {
    Write-Host ".vimrc文件已成功复制到 $destinationFile"
} else {
    Write-Host "复制失败，请检查权限或文件路径"
}

# 获取当前目录下的.wezterm.lua文件
$sourceFileWezterm = Join-Path -Path $PWD -ChildPath ".wezterm.lua"

# 设置目标文件路径（用户主目录下的.wezterm.lua）
$destinationFileWezterm = Join-Path -Path $HOME -ChildPath ".wezterm.lua"

# 复制文件，如果目标文件已存在则覆盖
Copy-Item -Path $sourceFileWezterm -Destination $destinationFileWezterm -Force

# 输出操作结果
if (Test-Path -Path $destinationFileWezterm) {
    Write-Host ".wezterm.lua文件已成功复制到 $destinationFileWezterm"
} else {
    Write-Host "复制失败，请检查权限或文件路径"
}
