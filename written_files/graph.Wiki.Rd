\name{graph.Wiki}
\alias{graph.Wiki}
\title{
igraph function for the adjacent matrix of Wikipedia
}
\description{
This function performs graph visualization against HyperLink.
}
\usage{
graph.Wiki(x, ...)
}
\arguments{
  \item{x}{
  HyperLink
}
  \item{\dots}{
  Some parameters for igraph
}
}
\value{
A graph output
}
\author{
Koki Tsuyuzaki
}

\seealso{
\code{\link{HyperLink}},
}
\examples{
data(HyperLink)
graph.Wiki(HyperLink, vertex.size=log10(rowSums(HyperLink)+1), vertex.color=rgb(0,1,1,0.5), edge.width=0.1)
}
