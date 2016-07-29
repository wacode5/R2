data("HyperLink")
data("Word2Vec")

# igraph
graph.Wiki(HyperLink, vertex.size=log10(rowSums(HyperLink)+1), vertex.color=rgb(0,1,1,0.5), edge.width=0.1)

# tsne
res.tsne <- tsne.Wiki(Word2Vec, dims=2)
plot(res.tsne$Y, pch=16, main="t-SNE of Pokemon GO-related Wikipedia pages", col=rgb(0,0,0,0.5), xlab="Dim1", ylab="Dim2")

