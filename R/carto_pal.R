#' CARTOcolor palettes
#'
#' Creates a color palette from CARTOcolor
#'
#' @param n Number of different colors in the palette, minimum depending on palette (2 or 3), maximum depending on palette (7 or 11)
#' @param name A palette name
#'
#' @return A character vector
#'
#' @examples
#' my_colors = carto_pal(7, "Burg")
#'
#' @export
carto_pal = function(n, name){
        if(!(name %in% rcartocolor::cartocolors$Name)){
                stop(paste(name,"is not a valid palette name for color_pal\n"))
        }
        selected_metadata = rcartocolor::metacartocolors[rcartocolor::metacartocolors$Name == name, ]
        min_n = selected_metadata$Min_n
        max_n = selected_metadata$Max_n
        if(is.null(n)){
                n = max_n
        }
        if(!(n %in% min_n:max_n)){
                warning(paste("Number of colors (n) in the", name,
                           "palette should be between", min_n, "and", max_n, "\n"))
                n = max_n
        }
        coln = paste0("n", n)
        rcartocolor::cartocolors[rcartocolor::cartocolors$Name == name, coln][[1]]
}
