# CARTOcolor palettes viewer

Displays a set of the color palettes from CARTOcolor

## Usage

``` r
display_carto_all(n = NULL, type = "all", colorblind_friendly = NULL)
```

## Arguments

- n:

  Number of colors to request. `NULL` uses the largest stored size for
  each palette. See
  [`carto_pal()`](https://jakubnowosad.com/rcartocolor/reference/carto_pal.md)
  for size limits.

- type:

  Type of the palette, can be "quantitative", "diverging",
  "qualitative", "aggregation", or "all"

- colorblind_friendly:

  if TRUE, display only colorblind friendly palettes

## Examples

``` r
display_carto_all()

display_carto_all(type = "quantitative")

display_carto_all(type = c("diverging", "qualitative", "aggregation"))

display_carto_all(3, type = "quantitative")

display_carto_all(7, type = "quantitative")

display_carto_all(7, colorblind_friendly = TRUE)

display_carto_all(7, type = c("diverging", "qualitative", "aggregation"),
  colorblind_friendly = TRUE)

```
