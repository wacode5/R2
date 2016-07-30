graph.Wiki <-
function(x){
g <- graph_from_adjacency_matrix(x, mode="directed", weighted=TRUE)
g
}
