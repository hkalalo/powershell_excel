function existFile {
  if ((Test-Path -Path $Path) -eq $false) {
    #file does not exist
    return $false
  }
  else {return $true}
}


function isFileOpen {
  param (
    [parameter(Mandatory=$true)][string]$Path
  )

  $oFile = New-Object System.IO.FileInfo $Path

  if (existFile){
    try {
      $oStream = $oFile.Open([System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)

      if ($oStream) {
        $oStream.Close()
      }
      return $false
    } catch {
      # file is in use by a process.
      return $true
    }
  }
}

<#> test
$path=""
$result=existFile
$result
$result=isFileOpen($path)
$result
#>
