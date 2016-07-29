pkgname <- "plotWikipedia"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('plotWikipedia')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("HyperLink")
### * HyperLink

flush(stderr()); flush(stdout())

### Name: HyperLink
### Title: A Adjacent Matrix of Wikipedia, which means the relation of
###   hyper-link
### Aliases: HyperLink
### Keywords: datasets

### ** Examples

data(HyperLink)



cleanEx()
nameEx("Word2Vec")
### * Word2Vec

flush(stderr()); flush(stdout())

### Name: Word2Vec
### Title: A Matrix of Wikipedia converted by word2vec
### Aliases: Word2Vec
### Keywords: datasets

### ** Examples

data(Word2Vec)



cleanEx()
nameEx("graph.Wiki")
### * graph.Wiki

flush(stderr()); flush(stdout())

### Name: graph.Wiki
### Title: igraph function for the adjacent matrix of Wikipedia
### Aliases: graph.Wiki

### ** Examples

data(HyperLink)
graph.Wiki(HyperLink, vertex.size=log10(rowSums(HyperLink)+1), vertex.color=rgb(0,1,1,0.5), edge.width=0.1)



cleanEx()
nameEx("plotWikipedia-package")
### * plotWikipedia-package

flush(stderr()); flush(stdout())

### Name: plotWikipedia-package
### Title: Do t-SNE and plot the Wikipedia Data
### Aliases: plotWikipedia-package plotWikipedia
### Keywords: package

### ** Examples

ls("package:plotWikipedia")



cleanEx()
nameEx("tsne.Wiki")
### * tsne.Wiki

flush(stderr()); flush(stdout())

### Name: tsne.Wiki
### Title: t-SNE function for the matrix of Wikipedia converted by word2vec
### Aliases: tsne.Wiki

### ** Examples

data(Word2Vec)
res.tsne <- tsne.Wiki(Word2Vec, dims=2)
plot(res.tsne$Y, pch=16, main="t-SNE of Pokemon GO-related Wikipedia pages", col=rgb(0,0,0,0.5), xlab="Dim1", ylab="Dim2")



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
