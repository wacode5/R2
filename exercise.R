# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # 2. データ型とデータ構造 # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

########################################
############## データ型 #################
########################################

################ 数値 ###################
# 整数と浮動小数点数は全てnumeric
1
is(1)
2.1
is(2.1)

# 四則演算（数字）
1 + 1 # 足し算
3 - 1 # 引き算
6 * 2 # 掛け算
4 / 2 # 割り算
2^5 # 2の5乗
log10(5) # 5の常用対数値

############### 文字列 ###################
# ""や''で囲む
"WACODE"
is("WACODE")

is(1) # 1は数値
is("1") # ""で囲むと文字列

try(1 + "1") # 数値と文字列を足すことはできない
paste0("WACODE", "5") # 文字列同士を連結することはできる
paste0("WACODE", 5) # paste0関数の仕様で、文字列と数値を連結することはできる

############### 論理値 ###################
TRUE
is(TRUE)
FALSE
is(FALSE)

# 真偽
1 == 1 # これはTRUE（==は同じという意味）
1 == 2 # これはFALSE
"python" == "python" # これはTRUE
"python" == "R" # これはFALSE
"python" != "R" # これはTRUE（!=は違うという意味）

################ 因子 ###################
# 同じものが複数
WACODE <- factor(c("python", "python", "R", "R", "R", "julia", "julia", "julia"))
nlevels(WACODE) # 3つある
levels(WACODE) # python, R, juliaがある

############ 型変換（キャスト）#############
as.numeric("12345")
as.character(WACODE) # 因子を文字列に変換する
as.numeric(WACODE) # 因子が数値になる？（よくバグの原因になる）
# 参考
# http://cse.naro.affrc.go.jp/takezawa/r-tips/r/25.html

########################################
############# データ構造 #################
########################################

############## ベクトル ##################
# c()でベクトルを作成
A <- c(2, 3, 1)
B <- c(-2, 1, -2)
# 各要素へのアクセス, Rは1-origin
A[1]
A[2]
A[3]
A[4] # 要素にないとNAになる
# 最大値、最小値、平均値、中央値
max(A)
min(A)
mean(B)
median(B)
# 要素ごとの掛け算（他の言語と違うところ）
A * B
# ベクトル同士の内積
A %*% B
# 文字例でもベクトル
C <- c("A", "B", "C", "A", "AA")
# Aがどこの場所にあるか
which(C == "A")
# lengthと組み合わせて使うことが多い
length(which(C == "A"))

################ 行列 ###################
# matrix()で行列を作成
E <- matrix(runif(6), nrow=2, ncol=3)
E[1,]
E[,2]
# 行数、列数
nrow(E)
ncol(E)
dim(E)
# cbind、rbind
cbind(A, B)
rbind(E, A, B)
# 行レベルでの和、列レベルでの和・平均値
rowSums(E)
colSums(E)
rowMeans(E)
colMeans(E)

########### データフレーム ###############
# 行列は一つの型しか扱えない
# 複数の型（数値、文字、TRUE/FALSE、因子など）を扱いたいときはデータフレーム
data(iris)
head(iris)
iris$Petal.Length # $で各列にアクセスできる

############### リスト ###################
# 行列で表現できないようなデータもリストで表現できる
G <- list(X = c(1,2,3), Y = matrix(runif(9), nrow=3), Z = TRUE)
G$X # $で各要素にアクセスできる
G$Y
G$Z

############### その他 ###################
str(G)
str(iris)
x <- runif(10)
y <- runif(10)
lr <- lm(y ~ x)
str(lr)
lr$coefficients


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # 3. 基本 # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

################ if-else ################
R <- "R"
julia <- "julia"
if(R == julia){
	print("Same!!!")
}else{
	print("Different...")
}

################## 繰り返し #################
H <- 1:20
for(i in 1:length(H)){
	print(H[i])
}

j <- 1
while(j <= 20){
	print(H[j])
	j <- j + 1
}

# foreachはパッケージをロードすれば使える
# http://qiita.com/hoxo_m/items/04903cbbe9d023f0ed6d


############### function #############
jijou <- function(x){
	x^2
}
jijou(3)

############# ディレクトリ操作 ###########
(d <- getwd()) # ()内の実行と、結果の出力を同時に行う
setwd("../") # 一つ上のディレクトリに移動
getwd()
setwd(d) # 元いたところに戻る
getwd()

############## ファイル操作 ##############
# TSVのI/O
write.table(iris, "iris.txt")
iris.tsv <- read.table("iris.txt")

# CSVのI/O
write.csv(iris, "iris.csv")
iris.csv <- read.table("iris.csv")

# バイナリデータのI/O
save(iris, file="iris.RData")
load("iris.RData")

# 全オブジェクトのI/O
save.image("20160806_WACODE.RData")
load("20160806_WACODE.RData")

############# システム関数 ##############
system("ls")  # UNIXコマンドをRから呼び出す
# 参考
# http://orangain.hatenablog.com/entry/20100916/1284631280

##### オブジェクト志向プログラミング #######

################ S3 ##################
# オブジェクトにclass属性を与えたもの。
# Rのオリジナル関数は大部分がS3で実装されている。
# 最初にクラスを定義したりせず、オブジェクトを生成し、後から属性をペタペタ貼っていくイメージ。
# 結構適当。

# まずオブジェクトを定義
taro <- list(name="Taro",grade=4,sex="Male", programming=T)
jiro <- list(name="Jiro",grade=3,sex="Male", programming=F)
hanako <- list(name="Hanako",grade=1,sex="Female", programming=T)

# あとづけでクラスを定義
class(taro) <- "Student"
class(jiro) <- "Student"
class(hanako) <- "Student"

# 出力関数showを定義（関数名.クラス名）
show.Student <- function(object){
    cat("This Student's name is",object$name,"\n",
            object$name,"'s grade is",object$grade,"\n",
            object$name,"'s sex is",object$sex,"\n")
    if(object$programming){
        cat(object$name,"loves programming!!!\n")
    }else{
        cat(object$name,"does not love programming....\n")
    }
}

# Studentにshowメソッドが加わった
methods(,"Student")

# Studentクラスを継承しているかを確認
inherits(taro, "Student")
inherits(jiro, "Student")
inherits(hanako, "Student")

# showメソッドを使ってみる
show(taro)
show(jiro)
show(hanako)

############### S4 ###################

# S3よりも本格的にオブジェクト指向。
# 継承する時に、与えた引数の型が違うとエラーを吐き出す点で、S3より優れている。
# BioConductor,GoogleはS4推し。

#まずStudentクラスを定義
#ここで値の型や自分でチェック項目を設定できるから、継承時に間違った値を入力するとエラーを出す。
setClass("student", # クラス名は小文字
    #フィールド
    representation(
        name="character",
        grade="numeric",
        sex="character",
        programming="logical"
    ),

    #初期値(コンストラクタ)
    prototype=prototype(
        name="John Doe",
        grade=1,
        sex="Male",
        programming=TRUE
    ),

    #チェック項目
    validity=function(object){
        (nchar(object@name) >1)&&
        ((object@grade >= 1)&&(object@grade <= 4))&&
        ((object@sex=="Male")||(object@sex=="Female"))&&
        ((object@programming==TRUE)||
                                    (object@programming==FALSE))
    }
)

#試しに何もパラメーターを与えずオブジェクト生成
#John Doe(初期値）が出現
test <- new("student")
test

#これから使うshowは汎用関数showを使ったものだと宣言
#この行は無くても走る
setGeneric("show",
        function(object) {
            standardGeneric("show")
        }
)

#出力メソッドをStudentクラスに追加
setMethod("show", "student",
    function(object){
    cat("This Student's name is",object@name,"\n",
            object@name,"'s grade is",object@grade,"\n",
            object@name,"'s sex is",object@sex,"\n")
        if(object@programming){
            cat(object@name,"loves programming!!!\n")
        }else{
            cat(object@name,"does not love programming....\n")
        }
    }
)

#クラスを継承した3つのオブジェクトを生成
taro <- new("student",name="Taro", grade=4, sex="Male", programming=T)
jiro <- new("student",name="Jiro", grade=3, sex="Male", programming=F)
hanako <- new("student",name="Hanako", grade=1, sex="Female", programming=T)

# studentクラスを継承しているかを確認
inherits(taro, "student")
inherits(jiro, "student")
inherits(hanako, "student")

# showメソッドを使ってみる
show(taro)
show(jiro)
show(hanako)

# 間違ったパラメーターを与えて、オブジェクト生成すると、エラーを出してくれる
try(kazuo <- new("student",name="Kazuo",grade=5, sex="Male",programming=F))

################# R5 #################
# R2.12から導入されたOOP。
# Reference Classと呼ばれる。
# S4と似ていてS4より優れていると思う。
# 汎用関数使うというよりかは、クラスに最初にメソッドを持たせる方針。
# 参照渡し（＊）ができる。
# よってでかいデータを渡す時に、コピーが発生しない。
# オブジェクトを後から変更できる。
# よって柔軟。
# JavaとかC++と書き方が似ている。

#Studentクラスを定義
st <- setRefClass(
	# クラス名を定義（大文字）
	Class = "Student",

	# フィールド（メンバ変数）を定義
	fields = list(
		name = "character",
		grade = "numeric",
		sex = "character",
		programming = "logical"
		),

	# メソッド（メンバ関数）を定義
	methods = list(
		#出力メソッド
	    show = function(){
	        cat("This Student's name is",name,"\n",
	            name,"'s grade is",grade,"\n",
	            name,"'s sex is",sex,"\n")
	        if(programming){
	            cat(name,"loves programming!!!\n")
	        }else{
	            cat(name,"does not love programming....\n")
	        }
	   }
	)
)

#クラスを継承した3つのオブジェクトを生成
taro <- st$new(name="Taro", grade=4, sex="Male", programming=TRUE)
jiro <- st$new(name="Jiro", grade=3, sex="Male", programming=FALSE)
hanako <- st$new(name="Hanako", grade=1, sex="Female", programming=TRUE)

#3つのオブジェクトがStudentクラスを実際に継承しているか確認
inherits(taro,"Student")
inherits(jiro,"Student")
inherits(hanako,"Student")

# outputメソッドを使ってみる
taro$show()
jiro$show()
hanako$show()


# 参考
# https://sites.google.com/site/scriptofbioinformatics/r-tong-ji-guan-xi/rnoobujekuto-zhi-xiangnitsuite-r
# http://stat.biopapyrus.net/dev/r5class.html

################# R6 #################
# R5と違い、フィールドに初期値を設定する
# public, privateの設定が可能
# パッケージをまたいで継承できる
# R5より速い

install.packages("R6")
library("R6")

st <- R6Class("Student", # クラス名は大文字、小文字どちらでも
	# 外から見える
 	public = list(
 		# メンバ変数を定義
 		name = "John Doe",
 		grade = 1,
 		sex = "Male",
 		programming = TRUE,

 		# 初期化関数（コンストラクタ）
 		initialize = function(name, grade, sex, programming){
 			self$name = name
 			self$grade = grade
 			self$sex = sex
 			self$programming = programming
 		},

 		# メンバ関数を定義
		#出力メソッド
	    show = function(){
	        cat("This Student's name is", self$name, "\n",
	            self$name,"'s grade is", self$grade, "\n",
	            self$name,"'s sex is", self$sex, "\n")
	        # プライベートな関数を利用
	        private$bool_program()
	   }
	),

	# 外からは見えない
	private = list(
		bool_program = function(){
	        if(self$programming){
	            cat(self$name, "loves programming!!!\n")
	        }else{
	            cat(self$name, "does not love programming....\n")
	        }
		}
	)
)

taro <- st$new(name="Taro", grade=4, sex="Male", programming=TRUE)
jiro <- st$new(name="Jiro", grade=3, sex="Male", programming=FALSE)
hanako <- st$new(name="Hanako", grade=1, sex="Female", programming=TRUE)

taro$show()
jiro$show()
hanako$show()

try(taro$bool_program()) # プライベートな関数はアクセスできない

# 参考
# https://cran.r-project.org/web/packages/R6/vignettes/Introduction.html
# http://www.slideshare.net/__nakamichi__/r6-upload?ref=


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # #  4. パッケージング # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

########################################
####### 既存パッケージのインストール ########
########################################

# 1. パッケージの使い方
# 1.2ダウンロード、インストール、ロード
# CRANパッケージの場合
install.packages("rgl")
library("rgl")

# Bioconductorパッケージの場合
source("https://bioconductor.org/biocLite.R")
biocLite("meshr")
library("meshr")

# GitHubパッケージ（野良パッケージ）の場合
install.packages("devtools")
library("devtools")
install_github("rikenbit/CCIPCA")
library("CCIPCA")

########################################
########## パッケージに対する操作 ##########
########################################
?plot3d # またはhelp("plot3d")
demo("rgl") # デモ
vignette("rgl") # ヴィネット
ls("package:rgl") # rglパッケージ内で定義されたオブジェクト


########################################
###### Step.1 : オブジェクトを用意 ########
########################################
# 最初に動くコードを書いておく
install.packages("Rtsne")
install.packages("igraph")
library("Rtsne")
library("igraph")

########################################
######## 事前に必要だった前処理 ############
########################################
# ページ間のリンク関係データを読み込み
HyperLink <- read.csv("HyperLink.txt", header=TRUE)
HyperLink <- as.matrix(HyperLink)
PageTitles <- gsub("X.wiki.", "", colnames(HyperLink))
PageTitles <- gsub("\\.", "%", PageTitles)
PageTitles <- gsub("_%", "", PageTitles)
PageTitles <- gsub("%$", "", PageTitles)
PageTitles <- gsub("%HTTP$", "", PageTitles)
PageTitles[274] <- "Web_Proxy_Auto_Discovery_Protocol"
PageTitles[284] <- "Application_Layer_Protocol_Negotiation"
PageTitles[480] <- "ワールドトレードセンター"
PageTitles[899] <- "Vert_manager"
PageTitles[923] <- "K_Meleon"
PageTitles[1453] <- "アップル_インコーポレイテッド"
for(i in 1:length(PageTitles)){
	print(i)
	# if(substr(PageTitles[i], 1, 1) == "%"){
	if(length(grep("%", PageTitles[i])) == 1){
		PageTitles[i] <- URLdecode(PageTitles[i])
		print(PageTitles[i])
	}else{
		print(PageTitles[i])
	}
}
PageTitles <- gsub("\\.", "_", PageTitles)

# 行名、列名をぺージ名にする
rownames(HyperLink) <- PageTitles
colnames(HyperLink) <- PageTitles

# 隣接行列をエッジ同士のリストに変換（Cytoscape用）
install.packages("PCIT")
library("PCIT")
write.table(getEdgeList(HyperLink), "HyperLink_EdgeList.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)

# Word2Vecデータを読み込み
Word2Vec <- read.csv("Word2Vec.txt", header=FALSE)
Word2Vec <- Word2Vec[, 2:ncol(Word2Vec)]

# 関数定義（HyperLinkに対して、インタラクティブなグラフを見る）
graph.Wiki <- function(x, ...){
	g <- graph_from_adjacency_matrix(x, mode="directed", weighted=TRUE)
	plot.igraph(g, vertex.label=V(g)$name, ...)
}

# 関数定義（Word2Vecに対してtsneを実行する）
tsne.Wiki <- function(x, ...){
	Rtsne(x, ...)
}

########################################
###### Step.2 : ディレクトリを生成 ########
########################################
system("rm -rf plotWikipedia")
package.skeleton(name="plotWikipedia", list=c("Word2Vec", "HyperLink", "tsne.Wiki", "graph.Wiki"))
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
# graph.Wiki関数のヘルプ
system("cp written_files/graph.Wiki.Rd plotWikipedia/man/")
# tsne.Wiki関数のヘルプ
system("cp written_files/tsne.Wiki.Rd plotWikipedia/man/")

########################################
######## Step.5 : デモコードの設定 ########
########################################
system("mkdir -p plotWikipedia/demo")
system("cp written_files/00Index plotWikipedia/demo")
system("cp written_files/plotWikipedia.R plotWikipedia/demo")

########################################
########## Step.6 : ヴィネット ###########
########################################
system("mkdir -p plotWikipedia/vignettes")
system("cp written_files/plotWikipedia.Rmd plotWikipedia/vignettes")

########################################
########## Step.7 : 単体テスト ###########
########################################
# plotWikipedia/tests/testthat以下に、test_*.Rというファイルを置く
# R CMD CHECK時に呼び出される
system("mkdir -p plotWikipedia/tests")
system("mkdir -p plotWikipedia/tests/testthat")
system("cp testthat.R plotWikipedia/tests/")
system("cp test_HyperLink.R plotWikipedia/tests/test_HyperLink.R")
system("cp test_Word2Vec.R plotWikipedia/tests/test_Word2Vec.R")
system("cp test_graph.Wiki.R plotWikipedia/tests/test_graph.Wiki.R")
system("cp test_tsne.Wiki.R plotWikipedia/tests/test_tsne.Wiki.R")

########################################
######### Step.8 : R CMD CHECK #########
########################################
system("R CMD CHECK plotWikipedia")

########################################
######### Step.9 : R CMD BUILD #########
########################################
system("R CMD BUILD --resave-data plotWikipedia")

########################################
####### Step.10 : R CMD INSTALL ########
########################################
system("R CMD INSTALL plotWikipedia_0.99.0.tar.gz")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # 5. 言語の特性を生かした解析例 # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# パッケージ読み込み
library("plotly")
# 自作パッケージ読み込み
library("plotWikipedia")
# 自作データ読み込み
data("HyperLink")
data("Word2Vec")

# グラフを可視化
graph.Wiki(HyperLink, vertex.size=log10(rowSums(HyperLink)+1), vertex.color=rgb(0,1,1,0.5), edge.width=0.1)

# tsne実行
res.tsne <- tsne.Wiki(Word2Vec, dims=2)
# plot(res.tsne$Y, pch=16, main="t-SNE of Pokemon GO-related Wikipedia pages", col=rgb(0,0,0,0.5), xlab="Dim1", ylab="Dim2")

# tsneの結果を可視化
tsne_plolty <- data.frame(res.tsne$Y)
colnames(tsne_plolty) <- paste0("Dim", 1:2)
plot_ly(tsne_plolty, x=~Dim1, y=~Dim2, type = "scatter", text=PageTitles)






