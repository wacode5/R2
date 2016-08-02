\name{plotlyGraph}
\alias{plotlyGraph}

\title{
Interactive Graph Plot
}
\description{
This function requires the igraph object and exports intereactive plot.
}
\usage{
plotlyGraph(x, label, color)
}

\arguments{
  \item{x}{
igraph object
}
  \item{label}{
label against each data point
}
  \item{color}{
color against each data point
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
data("label.Pokemon")
res.igraph <- graph_from_adjacency_matrix(HyperLink, mode="directed", weighted=TRUE)
plotlyGraph(res.igraph, label=rownames(HyperLink), color=label.Pokemon)
}
