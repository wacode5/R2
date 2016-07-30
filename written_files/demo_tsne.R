library("Rtsne")

data("Word2Vec")

res.tsne <- Rtsne(Word2Vec, dims=2)
plotlyScatter(res.tsne)
