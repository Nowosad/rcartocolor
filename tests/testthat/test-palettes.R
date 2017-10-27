context("palette generation")
test_that("palette generation is accurate", {

        # data is intact
        expect_equal(dim(cartocolors), c(34, 12))
        expect_equal(dim(metacartocolors), c(34, 4))

        # options work as expected
        expect_equal(carto_pal(2, name = "Safe"), c("#88CCEE", "#CC6677", "#888888"))
        expect_equal(carto_pal(3, name = "PurpOr"), c("#f9ddda", "#ce78b3", "#573b88"))
        expect_equal(carto_pal(2, name = "Burg"), c("#ffc6c4", "#672044"))

        # bad inputs
        expect_error(carto_pal(2, name = "PurpOr"))
        expect_error(carto_pal(12, name = "Burg"))
        expect_error(carto_pal(name = "Burg"))
        expect_error(carto_pal("New name"))
        expect_error(carto_pal(6, "New name"))
        expect_error(carto_pal(1))

})
