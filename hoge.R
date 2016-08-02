load("HyperLink.RData")
load("Word2Vec.RData")
load("label.Pokemon.RData")

# 関数定義（igraphオブジェクトを、plotlyで可視化する）
plotlyGraph <- function(x, label, color){
	# レイアウトを設定
	L <- layout_nicely(x)
	# ノード
	vs <- V(x)
	# エッジリストに変換
	es <- as.data.frame(get.edgelist(x))
	# ノード数
	Nv <- length(vs)
	# エッジ数
	Ne <- length(es[1]$V1)
	# 有向エッジのfromとto
	Xn <- L[,1]
	Yn <- L[,2]
	# plotly
	network <- plot_ly(type = "scatter", x = Xn, y = Yn, mode = "markers", text = names(vs), hoverinfo = "text", marker=list(size=20, opacity=0.5, text=label), colors=c("blue", "red"), color=as.factor(color))

	edge_shapes <- list()
	for(i in 1:Ne) {
	  v0 <- es[i,]$V1
	  v1 <- es[i,]$V2

	  edge_shape = list(
	    type = "line",
	    line = list(color = rgb(0,0,0.1), width = 0.001),
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

# 関数定義
plotlyScatter <- function(x, label, color){
	# tsneの結果を可視化
	tsne_plolty <- data.frame(x$Y)
	colnames(tsne_plolty) <- paste0("Dim", 1:2)
	plot_ly(tsne_plolty, x=~Dim1, y=~Dim2, type="scatter", mode="markers", colors=c("purple", "orange"), color=as.factor(color), marker=list(size=20, opacity=0.5), text=label, hoverinfo = "text")
}

########################################
###### Step.2 : ディレクトリを生成 ########
########################################
system("rm -rf plotWikipedia")
package.skeleton(name="plotWikipedia", list=c("Word2Vec", "HyperLink", "label.Pokemon", "plotlyGraph", "plotlyScatter"))
# まずRead-and-delete-meを削除
system("rm -rf plotWikipedia/Read-and-delete-me")

########################################
####### Step.3 : 設定ファイル編集 #########
########（すでに書いたものをコピー） ########
########################################
# DESCRIPTION
system("cp written_files/DESCRIPTION plotWikipedia/DESCRIPTION")
# NAMESPACE
system("cp written_files/NAMESPACE plotWikipedia/NAMESPACE")
# NEWS
system("mkdir -p plotWikipedia/inst")
system("cp written_files/NEWS plotWikipedia/inst/NEWS")
# CITATION
system("cp written_files/CITATION plotWikipedia/inst/CITATION")

########################################
#### Step.4 : ヘルプドキュメント編集 ######
########（すでに書いたものをコピー） ########
########################################
# plotWikipediaパッケージ自体のヘルプ
system("cp written_files/plotWikipedia-package.Rd plotWikipedia/man/")
# HyperLink（データ）のヘルプ
system("cp written_files/HyperLink.Rd plotWikipedia/man/")
# Word2Vec（データ）のヘルプ
system("cp written_files/Word2Vec.Rd plotWikipedia/man/")
# label.Pokemon（データ）のヘルプ
system("cp written_files/label.Pokemon.Rd plotWikipedia/man/")
# plotlyGraph関数のヘルプ
system("cp written_files/plotlyGraph.Rd plotWikipedia/man/")
# plotlyScatter関数のヘルプ
system("cp written_files/plotlyScatter.Rd plotWikipedia/man/")

########################################
######## Step.5 : デモコードの設定 ########
########（すでに書いたものをコピー） ########
########################################
system("mkdir -p plotWikipedia/demo")
system("cp written_files/00Index plotWikipedia/demo")
system("cp written_files/demo_graph.R plotWikipedia/demo")
system("cp written_files/demo_tsne.R plotWikipedia/demo")

########################################
########## Step.6 : ヴィネット ###########
########（すでに書いたものをコピー） ########
########################################
system("mkdir -p plotWikipedia/vignettes")
system("cp written_files/plotWikipedia.Rmd plotWikipedia/vignettes")
system("cp written_files/plotWikipedia.html plotWikipedia/vignettes")
system("mkdir -p plotWikipedia/inst")
system("mkdir -p plotWikipedia/inst/doc")
system("cp written_files/plotWikipedia.Rmd plotWikipedia/inst/doc")
system("cp written_files/plotWikipedia.html plotWikipedia/inst/doc")

########################################
########## Step.7 : 単体テスト ###########
########（すでに書いたものをコピー） ########
########################################
# plotWikipedia/tests/testthat以下に、test_*.Rというファイルを置く
# R CMD CHECK時に呼び出される
system("mkdir -p plotWikipedia/tests")
system("mkdir -p plotWikipedia/tests/testthat")
system("cp written_files/testthat.R plotWikipedia/tests/")
system("cp written_files/test_HyperLink.R plotWikipedia/tests/testthat/")
system("cp written_files/test_Word2Vec.R plotWikipedia/tests/testthat/")

# ########################################
# ######### Step.8 : R CMD CHECK #########
# ########################################
# system("R CMD CHECK plotWikipedia > log")

########################################
######### Step.9 : R CMD BUILD #########
########################################
system("R CMD BUILD --resave-data plotWikipedia")

########################################
####### Step.10 : R CMD INSTALL ########
########################################
system("R CMD INSTALL plotWikipedia_0.99.0.tar.gz")


try(detach("package:plotWikipedia"))
library("plotWikipedia")
vignette("plotWikipedia")
