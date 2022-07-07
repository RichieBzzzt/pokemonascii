Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    $pokemonPsd1Path = (Get-Module -ListAvailable pokemonascii).path
    $PokemonFolderPath = Split-Path $pokemonPsd1Path -Parent
    $PokemonFolderPath
        
}
