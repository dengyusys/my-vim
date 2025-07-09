function Copy-ConfigFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$sourcePath,
        
        [Parameter(Mandatory=$true)]
        [string]$destinationFolder
    )
    
    # 获取文件名
    $fileName = Split-Path -Path $sourcePath -Leaf
    
    # 构建目标文件完整路径
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $fileName
    
    # 复制文件，如果目标文件已存在则覆盖
    Copy-Item -Path $sourcePath -Destination $destinationPath -Force
    
    # 输出操作结果
    if (Test-Path -Path $destinationPath) {
        Write-Host "$fileName 文件已成功复制到 $destinationPath"
    } else {
        Write-Host "复制失败，请检查权限或文件路径"
    }
}

# 导出函数，使其可被其他脚本导入
Export-ModuleMember -Function Copy-ConfigFile
