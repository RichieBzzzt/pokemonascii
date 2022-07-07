Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    $uponelevel = Split-Path (Split-Path $PSCommandPath)
    $pkmnAsciiFile = Join-Path -Path $uponelevel -ChildPath (Join-Path 'pkmnasciifiles' "$pokemon.txt")
    if ((Test-Path $pkmnAsciiFile) -eq $True){
    Write-Host $pkmnAsciiFile
    $gottaCatchEmAll = Get-Content -Path $pkmnAsciiFile
    $gottaCatchEmAll
}
}
