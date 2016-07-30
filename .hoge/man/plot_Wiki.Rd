\name{plot_Wiki}
\alias{plot_Wiki}
\title{
Interactive plot function for igraph object
}
\description{
This function export an interactive graph plot.
}
\usage{
plot_Wiki(x)
}
\arguments{
  \item{x}{
  Output of graph_Wiki
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
res.graph <- graph_Wiki(HyperLink)
plot_Wiki(res.graph)
}
