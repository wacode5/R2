data("HyperLink")

context("Test of HyperLink...")
test_that("HyperLink may be collapsed!!!", {
	expect_equivalent(dim(HyperLink), c(500, 500))
	})
