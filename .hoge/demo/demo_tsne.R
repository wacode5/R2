data("HyperLink")

# igraph
res.graph <- graph_Wiki(HyperLink)
plot_Wiki(res.graph)


data("Word2Vec")

# tsne
res.tsne <- tsne_Wiki(Word2Vec, dims=2)
plot(res.tsne$Y, pch=16, main="t-SNE of Pokemon GO-related Wikipedia pages", col=rgb(0,0,0,0.5), xlab="Dim1", ylab="Dim2")

