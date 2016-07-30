library("igraph")

data("HyperLink")

res.igraph <- graph_from_adjacency_matrix(HyperLink, mode="directed", weighted=TRUE)
plotlyGraph(res.igraph)

