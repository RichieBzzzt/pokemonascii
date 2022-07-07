Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    $uponelevel = Split-Path (Split-Path $PSCommandPath)
    $pkmnAsciiFiles = Join-Path -Path $uponelevel -ChildPath (Join-Path -Path (Join-Path 'pkmnasciifiles' $pokemon) -ChildPath ".txt")
    Test-Path $pkmnAsciiFiles
    Write-Host $pkmnAsciiFiles
}
