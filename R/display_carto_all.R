#' CARTOcolor palettes viewer
#'
#' Displays a set of color palettes from CARTOcolor
#'
#' @param n Number of different colors in the palette, minimum depending on palette (2 or 3), maximum depending on palette (7 or 11)
#' @param name A palette name
#'
#' @return A character vector
#'
#' @importFrom graphics image
#'
#' @examples
#'
display_carto_all = function(n = NULL, type = "all"){
        if(type == "all"){
                selected_type = rcartocolor::cartocolors
        } else{
                selected_type = rcartocolor::cartocolors[rcartocolor::cartocolors$Type %in% type, ]
        }

        if(is.null(n)){
                selected_metadata = rcartocolor::metacartocolors[rcartocolor::metacartocolors$Name %in% selected_type$Name, ]
        }

        selected_colors = vector("list", nrow(selected_metadata))

        for (i in seq_len(nrow(selected_metadata))){
                selected_colors[[i]] = carto_pal(n = selected_metadata$Max_n[i], name = selected_metadata$Name[i])
        }

        # ylim = c(0, nrow(selected_metadata))
        # oldpar = par(mgp = c(2, 0.25, 0))
        # on.exit(par(oldpar))
        # plot(1, 1, xlim = c(0, max(selected_metadata$Max_n)), ylim = ylim, type="n", axes=FALSE, bty="n",
        #      xlab = "", ylab = "")
        #
        # for(i in 1:seq_len(nrow(selected_metadata))){
        #         nj = n[i]
        #         if (colorlist[i]=="") next
        #         shadi <- brewer.pal(nj, colorlist[i])
        #         rect(xleft=0:(nj-1), ybottom=i-1, xright=1:nj, ytop=i-0.2, col=shadi,
        #              border="light grey")
        # }
        #
        #
        # image(1:selected_metadata$Max_n, 1, as.matrix(1:selected_metadata$Max_n), col = selected_colors,
        #       main = paste0(name, ": ", selected_type, " (", n ,")"),
        #       xlab = " ", ylab = " ", xaxt = "n", yaxt = "n", bty="n")
}
