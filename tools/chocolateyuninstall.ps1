$installLocation = "$env:ProgramFiles\IOTA Foundation\GoShimmer\"

Write-Host "Removing $installLocation folder..."
Remove-Item $installLocation -Recurse -Force

Write-Host "Removing $installLocation from PATH..."
$path = [System.Environment]::GetEnvironmentVariable('PATH', 'User')
$path = ($path.Split(';') | Where-Object { $_ -ne $installLocation }) -join ';'
[System.Environment]::SetEnvironmentVariable('PATH', $path, 'User')

Write-Host "Done."