library("Rtsne")

data("Word2Vec")
data("label.Pokemon")

set.seed(123)
res.tsne <- Rtsne(Word2Vec, dims=2)
plotlyScatter(res.tsne, label=rownames(Word2Vec), color=label.Pokemon)
