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
        }
        proper_n = n
        if(proper_n > max_n){
                proper_n = max_n
        }
        if(!(n %in% min_n:max_n) && type == "qualitative"){
                warning(paste("Number of colors (n) in the", name,
                           "palette should be between", min_n, "and", max_n, "\n"), call. = FALSE)
                n = proper_n
        }
        if(!(n >= min_n)){
                warning(paste("Number of colors (n) in the", name,
                              "palette should be between", min_n, "and", max_n, "\n"), call. = FALSE)
                proper_n = min_n
                n = min_n
        }
        coln = paste0("n", proper_n)
        colors = rcartocolor::cartocolors[rcartocolor::cartocolors$Name == name, coln][[1]]
        if (n > 2){
                colors = grDevices::colorRampPalette(colors, ...)(n = n)
        }
        return(colors)
}
