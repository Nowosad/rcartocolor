# CARTOcolor palette viewer

Displays a color palette from CARTOcolor

## Usage

``` r
display_carto_pal(n = NULL, name)
```

## Arguments

- n:

  Number of colors to request. `NULL` uses the largest stored size. See
  [`carto_pal()`](https://jakubnowosad.com/rcartocolor/reference/carto_pal.md)
  for size limits.

- name:

  A palette name

## Examples

``` r
display_carto_pal(7, "Burg")

```
