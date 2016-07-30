\name{graph_Wiki}
\alias{graph_Wiki}
\title{
igraph function for the adjacent matrix of Wikipedia
}
\description{
This function converts the adjacent matrix to igraph object.
}
\usage{
graph_Wiki(x)
}
\arguments{
  \item{x}{
  HyperLink
  }
}
\value{
igraph object
}
\author{
Koki Tsuyuzaki
}

\seealso{
\code{\link{HyperLink}},
}
\examples{
data(HyperLink)
res.graph <- graph_Wiki(HyperLink)
}
