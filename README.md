# R2
tutorial for R level 2

# 講義資料

**ここにslideshareのURLを書く**

# ファイルの説明
- exercise.R : 講義で利用した全ソースコード
- graph_en.csv : Wikipediaのぺージ間のリンク関係データ（隣接行列）
- HyperLink_EdgeList.txt : Wikipediaのぺージ間のリンク関係データ（エッジリスト）
- result_vector.csv : Wikipediaのぺージをword2vecでベクトル化し、行列としてまとめたもの
- plotWikipedia : 講義中で完成するRパッケージ
- written_files : すでに記入した設定ファイル、ドキュメント

# 依存パッケージ
```{r}
install.packages("rgl", repos="https://cran.ism.ac.jp")

source("https://bioconductor.org/biocLite.R")
biocLite("meshr")

install.packages("devtools", repos="https://cran.ism.ac.jp")
library("devtools")
install_github("rikenbit/CCIPCA")

install.packages("Rtsne", repos="https://cran.ism.ac.jp")
install.packages("igraph", repos="https://cran.ism.ac.jp")
install.packages("plotly", repos="https://cran.ism.ac.jp")
install.packages("knitr", repos="https://cran.ism.ac.jp")
install.packages("testthat", repos="https://cran.ism.ac.jp")
```

# コードの動かし方
全て、exercise.Rに書かれています。
Rを起動後、コンソール画面にコピー&ペーストして使ってください。
