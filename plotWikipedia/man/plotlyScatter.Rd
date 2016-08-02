\name{plotlyScatter}
\alias{plotlyScatter}

\title{
Interactive Scatter Plot
}
\description{
This function requires the output of Rtsne and exports intereactive plot.
}
\usage{
plotlyScatter(x, label, color)
}

\arguments{
  \item{x}{
  Output of Rtsne
}
  \item{label}{
label against each data point
}
  \item{color}{
color against each data point
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
data("label.Pokemon")
res.tsne <- Rtsne(Word2Vec, dims=2)
plotlyScatter(res.tsne, label=rownames(Word2Vec), color=label.Pokemon)
}
