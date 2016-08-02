# データ取得
system("wget --no-check-certificate https://s3-ap-northeast-1.amazonaws.com/joemphilipschunk/result_vector.csv")
system("wget --no-check-certificate https://s3-ap-northeast-1.amazonaws.com/joemphilipschunk/graph_en.csv")

# ページ間のリンク関係データを読み込み
HyperLink <- read.csv("graph_en.csv", header=TRUE)
HyperLink <- as.matrix(HyperLink)

# Word2Vecデータを読み込み
Word2Vec <- read.csv("result_vector.csv", header=FALSE)

# リンクが0のものを除く
target <- which(rowSums(HyperLink) >=2)
HyperLink <- HyperLink[target, target]
Word2Vec <- Word2Vec[target, 2:ncol(Word2Vec)]

# 行名・列名の整形
PageTitles <- gsub("X.wiki.", "", colnames(HyperLink)) # 先頭のX.wiki
PageTitles <- gsub("\\.", "%", PageTitles) # Rで読み込んだ時に、%が.になる
target2 <- grep("^%", PageTitles, invert=TRUE)
PageTitles <- PageTitles[target2]
PageTitles <- gsub("_%", "", PageTitles)
PageTitles <- gsub("%_", "", PageTitles)
PageTitles <- gsub("^%", "", PageTitles)
PageTitles <- gsub("%$", "", PageTitles)
for(i in 1:length(PageTitles)){
	print(i)
	if(length(grep("%[A-Z][0-9]", PageTitles[i])) == 1){
		PageTitles[i] <- URLdecode(PageTitles[i])
		print(PageTitles[i])
	}else{
		print(PageTitles[i])
	}
}
PageTitles <- gsub("%", "", PageTitles)

# 日本語の記事を除く
HyperLink <- HyperLink[target2, target2]
Word2Vec <- Word2Vec[target2, ]

# Yahooが重複しているから除く
target3 <- setdiff(1:nrow(Word2Vec), which(PageTitles == "Yahoo")[2])
PageTitles <- PageTitles[target3]
HyperLink <- HyperLink[target3, target3]
Word2Vec <- Word2Vec[target3, ]

# 行名、列名をぺージ名にする
rownames(HyperLink) <- PageTitles
colnames(HyperLink) <- PageTitles
rownames(Word2Vec) <- PageTitles
colnames(Word2Vec) <- paste0("Dim", 1:50)

# さらにランダムに間引く
set.seed(12345)
PageTitles <- sample(PageTitles, 500)
PageTitles[grep("Pokémon", PageTitles)]
HyperLink <- HyperLink[PageTitles, PageTitles]
Word2Vec <- Word2Vec[PageTitles, ]

# 保存
save(HyperLink, file="HyperLink.RData")
save(Word2Vec, file="Word2Vec.RData")

# データ削除（GitHubで転送できないから）
system("rm result_vector.csv")
system("rm graph_en.csv")