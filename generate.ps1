<#
.SYNOPSIS
script to generate hard links to other scripts
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
  & fsutil hardlink create $SymPath $Real
}

Sym-Link "generate-clibs.ps1" "C:/clibs/generate.ps1"
