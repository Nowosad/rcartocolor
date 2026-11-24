#' CARTOcolor palettes
#'
#' Creates a color palette from CARTOcolor
#'
#' @param n Number of different colors in the palette, minimum depending on palette (2 or 3), maximum depending on palette (7 or 11)
#' @param name A palette name
#' @param ... Additional arguments for [grDevices::colorRampPalette]
#'
#' @return A character vector
#'
#' @examples
#' my_colors1 = carto_pal(7, "Burg")
#' my_colors1
#'
#' my_colors2 = carto_pal(17, "Burg")
#' my_colors2
#'
#' my_colors3 = carto_pal(17, "Safe")
#' my_colors3
#' @export
carto_pal = function(n = NULL, name, ...){
        if(!(name %in% rcartocolor::cartocolors$Name)){
                stop(paste(name,"is not a valid palette name for color_pal\n"))
        }
        selected_metadata = rcartocolor::metacartocolors[rcartocolor::metacartocolors$Name == name, ]
        min_n = selected_metadata$Min_n
        max_n = selected_metadata$Max_n
        type = selected_metadata$Type
        if(is.null(n)){
                n = max_n
        } else if (!is.numeric(n) || length(n) != 1L || !is.finite(n) || n != floor(n)) {
                stop("n must be a single finite whole number or NULL.", call. = FALSE)
        }
        if (n < min_n || (type == "qualitative" && n > max_n)) {
                warning(paste("Number of colors (n) in the", name,
                           "palette should be between", min_n, "and", max_n, "\n"), call. = FALSE)
                n = max(min_n, min(n, max_n))
        }
        coln = paste0("n", min(n, max_n))
        colors = rcartocolor::cartocolors[rcartocolor::cartocolors$Name == name, coln][[1]]
        if (n > 2 || length(list(...)) > 0L) {
                colors = grDevices::colorRampPalette(colors, ...)(n = n)
        }
        return(colors)
}
