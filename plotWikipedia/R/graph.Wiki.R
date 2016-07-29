graph.Wiki <-
function(x, ...){
g <- graph_from_adjacency_matrix(x, mode="directed", weighted=TRUE)
plot.igraph(g, vertex.label=V(g)$name, ...)
}
