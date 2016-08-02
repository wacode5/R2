library("igraph")

data("HyperLink")
data("label.Pokemon")

res.igraph <- graph_from_adjacency_matrix(HyperLink, mode="directed", weighted=TRUE)
plotlyGraph(res.igraph, label=rownames(HyperLink), color=label.Pokemon)

