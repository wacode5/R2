library("igraph")

data("HyperLink")
data("label.Pokemon")

res.igraph <- graph_from_adjacency_matrix(HyperLink, mode="directed", weighted=TRUE)
# 可視化
set.seed(123)
plotlyGraph(res.igraph, label=rownames(HyperLink), color=label.Pokemon)

