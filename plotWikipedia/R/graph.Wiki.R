graph.Wiki <-
function(x, ...){
	g <- graph_from_adjacency_matrix(hoge, mode="directed", weighted=TRUE)
	plot(g, ...)
}
