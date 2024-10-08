#' CARTO color scales
#'
#' @param type One of \"aggregation\", \"diverging\", \"qualitative\", or \"quantitative\"
#' @param palette If a string, will use that named palette. If a number, will
#'   index into the list of palettes of appropriate `type`
#' @param direction Sets the order of colors in the scale. If 1, the default,
#'   colors are as output by [carto_pal()]. If -1, the
#'   order of colors is reversed
#' @inheritParams scales::gradient_n_pal
#' @inheritParams ggplot2::continuous_scale
#' @inheritParams ggplot2::discrete_scale
#' @param ... Other arguments passed on to [ggplot2::discrete_scale()] or
#' [ggplot2::continuous_scale()] to control name, limits, breaks, labels and so forth
#'
#' @importFrom ggplot2 discrete_scale continuous_scale
#' @importFrom scales gradient_n_pal
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
#'         geom_boxplot() +
#'         scale_fill_carto_d(palette = 6, direction = -1)
#'
#' \dontrun{
#' library(sf)
#' library(spData)
#' library(ggplot2)
#' ggplot(world, aes(fill = lifeExp)) +
#'         geom_sf(data = world) +
#'         coord_sf(crs = "+proj=robin") +
#'         scale_fill_carto_c(name = "Life expectancy: ",
#'                            type = "diverging", palette = "Earth", direction = -1) +
#'         theme_void()
#'
#' ggplot(world, aes(fill = region_un)) +
#'         geom_sf(data = world) +
#'         coord_sf(crs = "+proj=robin")  +
#'         scale_fill_carto_d(name = "Region: ", palette = "Safe") +
#'         theme_void()
#' }
#' @rdname carto_scale
#' @export
#'
scale_color_carto_c = function(..., type = "quantitative",
                               palette = 1, direction = 1,
                               na.value = "#e9e9e9", guide = "colourbar") {
        continuous_scale("colour",
                         "carto_c",
                         gradient_n_pal(carto_pal_scale(type, palette, direction)(7)),
                         na.value = na.value,
                         guide = guide,
                         ...)
}

#' @rdname carto_scale
#' @export
scale_color_carto_d = function(..., type = "qualitative",
                               palette = 1, direction = 1,
                               na.value	= "#e9e9e9") {
        discrete_scale("colour",
                       "carto_d",
                       carto_pal_scale(type, palette, direction),
                       na.value	= na.value,
                       ...)
}


#' @rdname carto_scale
#' @aliases scale_color_carto_c
#' @export
scale_colour_carto_c = scale_color_carto_c

#' @rdname carto_scale
#' @aliases scale_color_carto_d
#' @export
scale_colour_carto_d = scale_color_carto_d

#' @rdname carto_scale
#' @export
scale_fill_carto_c = function(..., type = "quantitative",
                              palette = 1, direction = 1,
                              na.value = "#e9e9e9", guide = "colourbar") {
        continuous_scale("fill",
                         "carto_c",
                         gradient_n_pal(carto_pal_scale(type, palette, direction)(7)),
                         na.value = na.value,
                         guide = guide,
                         ...)
}

#' @rdname carto_scale
#' @export
scale_fill_carto_d = function(..., type = "qualitative",
                              palette = 1, direction = 1,
                              na.value	= "#e9e9e9") {
        discrete_scale("fill",
                       "carto_d",
                       carto_pal_scale(type, palette, direction),
                       na.value	= na.value,
                       ...)
}

carto_pal_scale = function(type = "quantitative", palette = 1, direction = 1) {
        pal = carto_pal_name(palette, type)

        function(n) {
                # If <3 colors are requested, brewer.pal will return a 3-color palette and
                # give a warning. This warning isn't useful, so suppress it.
                # If the palette has k colors and >k colors are requested, brewer.pal will
                # return a k-color palette and give a warning. This warning is useful, so
                # don't suppress it.
                if (n < 3) {
                        pal = suppressWarnings(carto_pal(n, pal))
                } else {
                        pal = carto_pal(n, pal)
                }
                # In both cases ensure we have n items
                pal = pal[seq_len(n)]

                if (direction == -1)
                        pal = rev(pal)

                pal
        }
}

carto_pal_name = function(palette, type) {
        if (is.character(palette)) {
                if (!palette %in% rcartocolor::cartocolors$Name) {
                        warning("Unknown palette ", palette)
                        palette = "Mint"
                }
                return(palette)
        }

        type = match.arg(type, unique(rcartocolor::cartocolors$Type))
        rcartocolor::cartocolors$Name[rcartocolor::cartocolors$Type == type][palette]
}
