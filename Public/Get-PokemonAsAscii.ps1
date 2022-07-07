Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    $uponelevel = Split-Path (Split-Path $PSCommandPath)
    Write-Host $uponelevel
    Get-ChildItem $uponelevel
}
