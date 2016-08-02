library("Rtsne")

data("Word2Vec")

context("Test of Word2Vec...")
test_that("Word2Vec may be collapsed!!!", {
	expect_equivalent(dim(Word2Vec), c(1512, 50))
	})
