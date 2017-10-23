#' CARTOcolor palettes viewer
#'
#' Displays a color palette from CARTOcolor
#'
#' @param n Number of different colors in the palette, minimum depending on palette (2 or 3), maximum depending on palette (7 or 11)
#' @param name A palette name
#'
#' @return A character vector
#'
#' @importFrom graphics image
#'
#' @examples
#' display_carto_pal(7, "Burg")
#'
#' @export
display_carto_pal = function(n, name){
        if(!(name %in% rcartocolor::cartocolors$Name)){
                stop(paste(name,"is not a valid palette name for color_pal\n"))
        }
        carto_type = rcartocolor::cartocolors[rcartocolor::cartocolors$Name == name, "Type"][[1]]
        image(1:n, 1, as.matrix(1:n), col = carto_pal(n, name),
              main = paste0(name, ": ", carto_type, " (", n ,")"),
              xlab = " ", ylab = " ", xaxt = "n", yaxt = "n", bty="n")
}
