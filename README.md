# R2
tutorial for R level 2

[![Build Status](https://travis-ci.org/wacode5/R2.svg?branch=master)](https://travis-ci.org/wacode5/R2)

# 講義資料

<iframe src="//www.slideshare.net/slideshow/embed_code/key/qrehaERoIl7r0w" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/antiplastics/r-64720240" title="Rによる統計解析と可視化" target="_blank">Rによる統計解析と可視化</a> </strong> from <strong><a target="_blank" href="//www.slideshare.net/antiplastics">弘毅 露崎</a></strong> </div>

# ファイルの説明
- **plotWikipedia** : 講義中で完成するRパッケージ
- **written_files** : すでに記入した設定ファイル、ドキュメント
- **.gitignore** : GitHubにcommit & pushしないファイルをまとめた設定ファイル
- **.travis.yml** : Travis CIの設定ファイル
- **README.md** : このファイル
- **exercise.R** : 講義で利用した全ソースコード
- **preprocess.R** : 講義で利用したデータを整形するために使ったコード
- **resultRtsne.txt** : t-SNEを実行した結果。次のjuliaの回でクラスタリングで使う

# 講習で利用するパッケージのダウンロード
会場でのパッケージのダウンロードは回線が混み合うことが予想されるため、 **必ず講習を受ける前に** 、事前にダウンロードしておいてください。
ダウンロードの仕方は、Rを起動後、以下をコンソール画面にコピー&ペーストして使ってください。

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
