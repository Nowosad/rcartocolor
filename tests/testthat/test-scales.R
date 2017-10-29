context("scales")
test_that("scales work correctly", {

        fill_scale = scale_fill_carto_c()
        expect_equal(fill_scale$is_discrete(), FALSE)

        fill_scale = scale_fill_carto_d()
        expect_equal(fill_scale$is_discrete(), TRUE)

        color_scale = scale_color_carto_c()
        expect_equal(color_scale$is_discrete(), FALSE)

        color_scale = scale_color_carto_d()
        expect_equal(color_scale$is_discrete(), TRUE)
})

context("colorandfill_c")
test_that("visual elements are correct", {

        skip_on_cran()

        library(ggplot2)
        library(MASS)
        # library(gridExtra)

        data("geyser", package="MASS")

        gg = ggplot(geyser, aes(x = duration, y = waiting)) +
                xlim(0.5, 6) + ylim(40, 110) +
                stat_density2d(aes(fill = ..level..), geom="polygon") +
                theme_bw() +
                theme(panel.grid = element_blank())

        A = gg + scale_fill_carto_c() + labs(x="C: default", y=NULL)
        B = gg + scale_fill_carto_c(palette = 4) + labs(x="C: 4", y=NULL)
        C = gg + scale_fill_carto_c(palette = "BluGrn") + labs(x="C: BluGrn", y=NULL)
        D = gg + scale_fill_carto_c(palette = 9, direction = 1) + labs(x="C: rev9", y=NULL)

        vdiffr::expect_doppelganger("a", A)
        vdiffr::expect_doppelganger("b", B)
        vdiffr::expect_doppelganger("c", C)
        vdiffr::expect_doppelganger("d", D)

})

context("colorandfill_d")
test_that("visual elements are correct", {

        skip_on_cran()

        library(ggplot2)
        # library(MASS)
        # library(gridExtra)

        data("msleep", package="ggplot2")

        gg = ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
                geom_boxplot()

        A = gg + scale_fill_carto_d() + labs(x="D: default", y=NULL)
        B = gg + scale_fill_carto_d(palette = 4) + labs(x="D: 4", y=NULL)
        C = gg + scale_fill_carto_d(palette = "Safe") + labs(x="D: Safe", y=NULL)
        D = gg + scale_fill_carto_d(palette = 6, direction = 1) + labs(x="D: rev6", y=NULL)

        vdiffr::expect_doppelganger("a", A)
        vdiffr::expect_doppelganger("b", B)
        vdiffr::expect_doppelganger("c", C)
        vdiffr::expect_doppelganger("d", D)

})
