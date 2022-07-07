Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    $pokemonPsd1Path = (Get-Module -ListAvailable pokemonascii).path
    $pokemonPsd1Path
    $PokemonFolderPath = Split-Path $pokemonPsd1Path
    $PokemonFolderPath
        
}
