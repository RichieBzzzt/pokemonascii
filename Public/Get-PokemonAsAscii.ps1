Function Get-PokemonAsAscii {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        $Pokemon
    )
    (Get-Module -ListAvailable pokemonascii).path    
    "Pika!"    
}
