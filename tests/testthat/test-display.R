context("display_pal")
test_that("visual elements are correct", {

        skip_on_cran()

        A3 = function() display_carto_pal(7, "Burg")
        B3 = function() display_carto_pal(2, "ag_GrnYl")
        C3 = function() display_carto_pal(12, "Bold")
        D3 = function() display_carto_pal(7, "Tropic")

        vdiffr::expect_doppelganger("a3", A3)
        vdiffr::expect_doppelganger("b3", B3)
        vdiffr::expect_doppelganger("c3", C3)
        vdiffr::expect_doppelganger("d3", D3)

})

context("display_carto_all")
test_that("visual elements are correct", {

        skip_on_cran()

        A4 = function() display_carto_all()
        B4 = function() display_carto_all(type = "quantitative")
        C4 = function() display_carto_all(type = c("diverging", "qualitative", "aggregation"))
        D4 = function() display_carto_all(3, type = "quantitative")
        E4 = function() display_carto_all(7, type = "quantitative")

        vdiffr::expect_doppelganger("a4", A4)
        vdiffr::expect_doppelganger("b4", B4)
        vdiffr::expect_doppelganger("c4", C4)
        vdiffr::expect_doppelganger("d4", D4)
        vdiffr::expect_doppelganger("E4", E4)
})
