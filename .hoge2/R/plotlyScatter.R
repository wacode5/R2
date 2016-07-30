plotlyScatter <-
function(x){
	# tsneの結果を可視化
	tsne_plolty <- data.frame(x$Y)
	colnames(tsne_plolty) <- paste0("Dim", 1:2)
	# ここを実際は、記事名に帰る
	plot_ly(tsne_plolty, x=~Dim1, y=~Dim2, type = "scatter", text=1:1512, color=rgb(1,0,0,0.5))
}
