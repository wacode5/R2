\name{plotlyGraph}
\alias{plotlyGraph}
\title{
Interactive Graph Plot
}
\description{
This function requires the igraph object and exports intereactive plot.
}
\usage{
plotlyGraph(x)
}
\arguments{
  \item{x}{
  igraph object
}
}
\value{
Interactive Graph Plot
}
\author{
Koki Tsuyuzaki
}

\examples{
library("igraph")
data("HyperLink")
res.igraph <- graph_from_adjacency_matrix(HyperLink, mode="directed", weighted=TRUE)
plotlyGraph(res.igraph)
}
