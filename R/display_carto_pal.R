#' CARTOcolor palette viewer
#'
#' Displays a color palette from CARTOcolor
#'
#' @param n Number of colors to request. `NULL` uses the largest stored size.
#'   See [carto_pal()] for size limits.
#' @param name A palette name
#'
#' @importFrom graphics image
#'
#' @examples
#' display_carto_pal(7, "Burg")
#'
#' @export
display_carto_pal = function(n = NULL, name){
        selected_colors = carto_pal(n, name)
        n = length(selected_colors)
        selected_type = rcartocolor::cartocolors[rcartocolor::cartocolors$Name == name, "Type"][[1]]
        image(1:n, 1, as.matrix(1:n), col = selected_colors,
              main = paste0(name, ": ", selected_type, " (", n ,")"),
              xlab = " ", ylab = " ", xaxt = "n", yaxt = "n", bty="n")
}
