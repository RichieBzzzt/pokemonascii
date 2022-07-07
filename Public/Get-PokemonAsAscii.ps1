Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    $uponelevel = Split-Path $PSCommandPath
    Write-Host $uponelevel
        
}
