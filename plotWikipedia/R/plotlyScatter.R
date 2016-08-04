plotlyScatter <-
function(x, label, color){
	# tsneの結果を可視化
	tsne_plolty <- data.frame(x$Y)
	colnames(tsne_plolty) <- paste0("Dim", 1:2)
	plot_ly(tsne_plolty, x=Dim1, y=Dim2, type="scatter", mode="markers", colors=c("orange", "purple"), color=as.factor(color), marker=list(size=20, opacity=0.5), text=label, hoverinfo = "text")
}
