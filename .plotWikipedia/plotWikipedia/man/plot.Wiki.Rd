\name{plot.Wiki}
\alias{plot.Wiki}
\title{
Interactive plot function for igraph object
}
\description{
This function export an interactive graph plot.
}
\usage{
plot.Wiki(x)
}
\arguments{
  \item{x}{
  Output of graph.Wiki
}
}
\value{
Interactive graph
}
\author{
Koki Tsuyuzaki
}

\examples{
data(HyperLink)
res.graph <- graph.Wiki(HyperLink)
plot.Wiki(res.graph)
}
