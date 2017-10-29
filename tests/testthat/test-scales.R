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

        expect_silent(rcartocolor:::carto_pal_scale()(1))

        expect_warning(rcartocolor:::carto_pal_scale(palette = "Best")(6))

})

context("colorandfill_c")
test_that("visual elements are correct", {

        skip_on_cran()

        library(ggplot2)
        library(MASS)

        data("geyser", package="MASS")

        gg = ggplot(geyser, aes(x = duration, y = waiting)) +
                xlim(0.5, 6) + ylim(40, 110) +
                stat_density2d(aes(fill = ..level..), geom = "polygon") +
                theme_bw() +
                theme(panel.grid = element_blank())

        A1 = gg + scale_fill_carto_c() + labs(x = "C: default", y = NULL)
        B1 = gg + scale_fill_carto_c(palette = 4) + labs(x = "C: 4", y = NULL)
        C1 = gg + scale_fill_carto_c(palette = "BluGrn") + labs(x = "C: BluGrn", y = NULL)
        D1 = gg + scale_fill_carto_c(palette = 9, direction = 1) + labs(x = "C: rev9", y = NULL)

        vdiffr::expect_doppelganger("a1", A1)
        vdiffr::expect_doppelganger("b1", B1)
        vdiffr::expect_doppelganger("c1", C1)
        vdiffr::expect_doppelganger("d1", D1)

})

context("colorandfill_d")
test_that("visual elements are correct", {

        skip_on_cran()

        library(ggplot2)

        data("msleep", package="ggplot2")

        gg = ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
                geom_boxplot()

        A2 = gg + scale_fill_carto_d() + labs(x = "D: default", y = NULL)
        B2 = gg + scale_fill_carto_d(palette = 4) + labs(x = "D: 4", y = NULL)
        C2 = gg + scale_fill_carto_d(palette = "Safe") + labs(x = "D: Safe", y = NULL)
        D2 = gg + scale_fill_carto_d(palette = 6, direction = 1) + labs(x = "D: rev6", y = NULL)

        vdiffr::expect_doppelganger("a2", A2)
        vdiffr::expect_doppelganger("b2", B2)
        vdiffr::expect_doppelganger("c2", C2)
        vdiffr::expect_doppelganger("d2", D2)

})
