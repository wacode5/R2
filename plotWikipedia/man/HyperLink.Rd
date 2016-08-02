\name{HyperLink}
\alias{HyperLink}
\docType{data}
\title{
A Adjacent Matrix of Wikipedia, which means the relation of hyper-link
}
\description{
This matrix has 500 rows and 500 columns (documents).
}
\usage{data("HyperLink")}
\format{
  The format is:
 int [1:500, 1:500] 0 0 0 0 0 0 0 0 0 0 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:500] "3G" "Linux" "Miitomo" "Financial_Times" ...
  ..$ : chr [1:500] "3G" "Linux" "Miitomo" "Financial_Times" ...
}
\examples{
data(HyperLink)
}
\keyword{datasets}
