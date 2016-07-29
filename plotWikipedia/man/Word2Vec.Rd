\name{Word2Vec}
\alias{Word2Vec}
\docType{data}
\title{
A Matrix of Wikipedia converted by word2vec
}
\description{
This matrix has *** rows (documents) and 100 columns (dimenstion).
}
\usage{data("Word2Vec")}
\format{
  The format is:
 num [1:6000, 1:100] 0.0525 0.7594 0.9145 0.4018 0.6652 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:6000] "Page1" "Page2" "Page3" "Page4" ...
  ..$ : chr [1:100] "Dim1" "Dim2" "Dim3" "Dim4" ...
}
\source{
https://en.wikipedia.org/wiki/Pokémon_Go
}
\examples{
data(Word2Vec)
}
\keyword{datasets}
