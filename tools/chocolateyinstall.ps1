$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/iotaledger/goshimmer/releases/download/v0.5.0/goshimmer-0.5.0_Windows_x86_64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url
$unzipLocation = "$env:ProgramFiles\IOTA Foundation\GoShimmer\"

$GoShimmerPackageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'goshimmer*'
  checksum      = ''
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '3d5fc807eff52369ea7bdbe51dd931fa616546db6227c1423af894b605c804a5'
  checksumType64= 'sha256' #default is checksumType
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @GoShimmerPackageArgs
Get-ChocolateyUnzip -FileFullPath "$toolsDir\goshimmer-launcher.zip" -Destination $unzipLocation
Install-ChocolateyPath "$env:ProgramFiles\IOTA Foundation\GoShimmer\" 'User'
