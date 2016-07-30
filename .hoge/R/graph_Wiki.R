graph_Wiki <-
function(x){
	# 隣接行列に変換
	g <- graph_from_adjacency_matrix(x, mode="directed", weighted=TRUE)
	g
}
