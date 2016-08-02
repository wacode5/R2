\name{plotlyScatter}
\alias{plotlyScatter}

\title{
Interactive Scatter Plot
}
\description{
This function requires the output of Rtsne and exports intereactive plot.
}
\usage{
plotlyScatter(x, label)
}

\arguments{
  \item{x}{
  Output of Rtsne
}
  \item{label}{
label for hover
 }
}
\value{
Interactive Scatter Plot
}
\author{
Koki Tsuyuzaki
}

\examples{
library("Rtsne")
data("Word2Vec")
res.tsne <- Rtsne(Word2Vec, dims=2)
plotlyScatter(res.tsne, label=rownames(Word2Vec))
}
