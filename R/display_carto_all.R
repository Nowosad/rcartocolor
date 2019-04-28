#' CARTOcolor palettes viewer
#'
#' Displays a set of the color palettes from CARTOcolor
#'
#' @param n Number of different colors in the palette, minimum depending on the palette (2 or 3), maximum depending on the palette (7 or 11)
#' @param type Type of the palette, can be "quantitative", "diverging", "qualitative", "aggregation", or "all"
#' @param colorblind_friendly if TRUE, display only colorblind friendly palettes
#'
#' @importFrom graphics par plot rect text
#'
#' @examples
#' display_carto_all()
#' display_carto_all(type = "quantitative")
#' display_carto_all(type = c("diverging", "qualitative", "aggregation"))
#' display_carto_all(3, type = "quantitative")
#' display_carto_all(7, type = "quantitative")
#' display_carto_all(7, colorblind_friendly = TRUE)
#' display_carto_all(7, type = c("diverging", "qualitative", "aggregation"),
#'   colorblind_friendly = TRUE)
#'
#' @export
display_carto_all = function(n = NULL, type = "all", colorblind_friendly = NULL){
        if(any(type == "all")){
                selected_type = rcartocolor::cartocolors
        } else if (any(type %in% c("quantitative", "diverging", "qualitative", "aggregation"))){
                selected_type = rcartocolor::cartocolors[rcartocolor::cartocolors$Type %in% type, ]
        } else{
                stop(paste(type, "is not a valid name for a color type\n"))
        }
        selected_metadata = rcartocolor::metacartocolors[rcartocolor::metacartocolors$Name %in% selected_type$Name, ]

        if(isTRUE(colorblind_friendly)){
                selected_metadata = selected_metadata[selected_metadata$Colorblind_friendly, ]
        }

        n_colors = nrow(selected_metadata)

        if(is.null(n)){
                my_n = selected_metadata$Max_n
        } else{
                my_n = rep(n, n_colors)
        }

        selected_colors = vector("list", n_colors)

        ylim = c(0, n_colors)
        oldpar = par(mgp = c(2, 0.25, 0))
        on.exit(par(oldpar))
        plot(1, 1, xlim = c(0, max(my_n)), ylim = ylim,
             type = "n", axes = FALSE, bty = "n", xlab = "", ylab = "")

        for(i in seq_len(n_colors)){
                one_color = carto_pal(n = my_n[i], name = selected_metadata$Name[i])
                rect(xleft = 0:(my_n[i] - 1), ybottom = i - 1, xright = 1:my_n[i], ytop = i-0.2, col = one_color,
                     border = "light grey")
        }
        text(rep(-0.1, n_colors), (1: n_colors) - 0.6, labels = selected_metadata$Name, xpd = TRUE, adj = 1)
}
