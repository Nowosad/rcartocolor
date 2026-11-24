# CARTOcolor palettes

Creates a color palette from CARTOcolor

## Usage

``` r
carto_pal(n = NULL, name, ...)
```

## Arguments

- n:

  Number of colors to request as a single finite whole number. `NULL`
  uses the largest stored size. Requests below the minimum or above the
  qualitative maximum (12) use the nearest stored size and warn. Other
  palettes interpolate above their stored maximum (7). See
  [metacartocolors](https://jakubnowosad.com/rcartocolor/reference/metacartocolors.md)
  for each palette's stored sizes.

- name:

  A palette name

- ...:

  Additional arguments for
  [grDevices::colorRampPalette](https://rdrr.io/r/grDevices/colorRamp.html)

## Value

A character vector

## Examples

``` r
my_colors1 = carto_pal(7, "Burg")
my_colors1
#> [1] "#FFC6C4" "#F4A3A8" "#E38191" "#CC607D" "#AD466C" "#8B3058" "#672044"

my_colors2 = carto_pal(17, "Burg")
my_colors2
#>  [1] "#FFC6C4" "#FAB8B9" "#F6ABAF" "#F19EA5" "#EB929C" "#E58593" "#DD788B"
#>  [8] "#D46C84" "#CC607D" "#C05676" "#B44C70" "#A84369" "#9B3A61" "#8F325A"
#> [15] "#822B52" "#74264B" "#672044"

my_colors3 = carto_pal(17, "Safe")
#> Warning: Number of colors (n) in the Safe palette should be between 3 and 12 
my_colors3
#>  [1] "#88CCEE" "#CC6677" "#DDCC77" "#117733" "#332288" "#AA4499" "#44AA99"
#>  [8] "#999933" "#882255" "#661100" "#6699CC" "#888888"
```
