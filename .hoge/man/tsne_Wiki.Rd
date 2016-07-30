\name{tsne_Wiki}
\alias{tsne_Wiki}
\title{
t-SNE function for the matrix of Wikipedia converted by word2vec
}
\description{
This function performs t-SNE against Word2Vec.
}
\usage{
tsne_Wiki(x, ...)
}
\arguments{
  \item{x}{
   Word2Vec
}
  \item{\dots}{
  Some parameters for Rtsne
}
}
\value{
Rtsne obeject
}
\references{
Laurens van der Maaten and Geoffrey Hinton (2008). Visualizing Data using t-SNE. Journal of Machine Learning Research Vol. 1, 1-48
}
\author{
Koki Tsuyuzaki
}

\seealso{
\code{\link{Word2Vec}},
}
\examples{
data(Word2Vec)
res.tsne <- tsne_Wiki(Word2Vec, dims=2)
}
