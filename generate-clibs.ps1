<#
.SYNOPSIS
script to generate symbolic links to various lib directories
#>

function Sym-Link {
  param (
    [Parameter(Mandatory=$true, Position=0)]
    [string] $Sym,
    [Parameter(Mandatory=$true, Position=1)]
    [string] $Real
  )

  $SymPath = Join-Path (Get-Location).Path $Sym
  (Get-Item $SymPath).Delete()
  New-item -ItemType SymbolicLink -Path $SymPath -Value $Real
}

Sym-Link "um" "C:/Program Files (x86)/Windows Kits/10/Lib/10.0.26100.0/um/x64"
Sym-Link "msvc" "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.43.34808\lib\x64"
Sym-Link "ucrt" "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\ucrt\x64"
Sym-Link "vulkan" "C:\VULKANSDK\1.4.309.0\LIB"
Sym-Link "glfw" "C:\GLFW-3.4.BIN.WIN64\LIB-VC2022"
