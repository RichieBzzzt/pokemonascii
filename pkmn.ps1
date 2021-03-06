
function Convert-ImageToAsciiArt
{
  param(
    [Parameter(Mandatory)][String]
    $Path,
    
    [ValidateRange(20,20000)]
    [int]$MaxWidth=80,
    
    # character height:width ratio
    [float]$ratio = 1.5
  )

  # load drawing functionality
  #Add-Type -AssemblyName System.Drawing
  
  # characters from dark to light
  $characters = '$#H&@*+;:-,. '.ToCharArray()
  $c = $characters.count
  
  # load image and get image size
  $image = [Drawing.Image]::FromFile($path)
  [int]$maxheight = $image.Height / ($image.Width / $maxwidth)/ $ratio
  
  # paint image on a bitmap with the desired size
  $bitmap = new-object Drawing.Bitmap($image,$maxwidth,$maxheight)
  
  
  # use a string builder to store the characters
  [System.Text.StringBuilder]$sb = ""
  
  # take each pixel line...
  for ([int]$y=0; $y -lt $bitmap.Height; $y++){
    # take each pixel column...
    for ([int]$x=0; $x -lt $bitmap.Width; $x++){
      # examine pixel
      $color = $bitmap.GetPixel($x,$y)
      $brightness = $color.GetBrightness()
      # choose the character that best matches the
      # pixel brightness
      [int]$offset = [Math]::Floor($brightness*$c)
      $ch = $characters[$offset]
      if (-not $ch){ $ch = $characters[-1] }      
      # add character to line
      $null = $sb.Append($ch)
    }
    # add a new line
    $null = $sb.AppendLine()
  }

  # clean up and return string
  $image.Dispose()
  $sb.ToString()
}

Function Initialize-PokemonImages {
    $base = "https://pokemondb.net"
    $p = Invoke-WebRequest -Uri $base"/pokedex/national"
    $plinks = $p.Links
    $what = $plinks | Where-Object class -eq 'ent-name'
    $imageLocation = Join-Path -Path $PSScriptRoot -ChildPath 'pkmnartwork'
    #New-Item -Path $imageLocation -ItemType Directory -Force

    ForEach ($w in $what) {
        $PokemonName = $w.href.Substring(9)
        $pokemonLink = $base + $w.href
        $PokedexEntry = Invoke-WebRequest $pokemonLink 
        $pokemonImage = $PokedexEntry.Images[0]
        $pkmnLink = $pokemonImage.outerHTML.Substring(10, (($pokemonImage.outerHTML.IndexOf("jpg")) - 7))
        $pkmnSaveFileName = $pkmnLink.Split("/")
        $pokemonArtworkFile = Join-Path -Path $imageLocation -ChildPath $pkmnSaveFileName[4]
        # Invoke-WebRequest -Uri $pkmnLink -OutFile $pokemonArtworkFile
        $NewChildPath = "/pkmnasciifiles/"+$PokemonName+".txt"
        $newpath = Join-Path -Path $PSScriptRoot -ChildPath $NewChildPath
        Convert-ImageToAsciiArt -Path $pokemonArtworkFile -MaxWidth 60 | Set-Content -Path $newpath -Encoding UTF8
    }

}


# $e = Get-ChildItem ./pkmnasciifiles/*
# $en = $e.Name

# foreach ($n in $en){

#   Write-Host "`"/pkmnasciifiles/$n`","
# }

Install-Module pokemonascii -Force
Import-Module pokemonascii

Get-PokemonAsAscii -Pokemon 'Dreepy'


