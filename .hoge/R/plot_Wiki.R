plot_Wiki <-
function(x){
	# レイアウトを設定
	L <- layout_nicely(x)
	# ノード
	vs <- V(x)
	# エッジリストに変換
	es <- as.data.frame(get.edgelist(x))
	es <- es[sample(1:nrow(es), 100), ]	# ここは本番では消す
	# ノード数
	Nv <- length(vs)
	# エッジ数
	Ne <- length(es[1]$V1)
	# 有向エッジのfromとto
	Xn <- L[,1]
	Yn <- L[,2]
	# plotly
	network <- plot_ly(type = "scatter", x = Xn, y = Yn, mode = "markers", text = vs$label, hoverinfo = 1:1512)

	edge_shapes <- list()
	for(i in 1:Ne) {
	  v0 <- es[i,]$V1
	  v1 <- es[i,]$V2

	  edge_shape = list(
	    type = "line",
	    line = list(color = "#030303", width = 0.3),
	    x0 = Xn[v0],
	    y0 = Yn[v0],
	    x1 = Xn[v1],
	    y1 = Yn[v1]
	  )

	  edge_shapes[[i]] <- edge_shape
	}

	# レイアウトを設定
	layout(
	  network,
	  title = 'HyperLink of Wikipedia',
	  shapes = edge_shapes,
	  xaxis = list(title = "", showgrid = FALSE, showticklabels = FALSE, zeroline = FALSE),
	  yaxis = list(title = "", showgrid = FALSE, showticklabels = FALSE, zeroline = FALSE)
	)
}
