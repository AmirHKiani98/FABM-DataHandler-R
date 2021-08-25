\name{points}
\alias{points}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
points()
}
%- maybe also 'usage' for other objects documented here.
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
structure(function () 
{
    .dependents$register()
    if (.invalidated || .running) {
        ..stacktraceoff..(self$.updateValue())
    }
    if (.error) {
        stop(.value)
    }
    if (.visible) 
        .value
    else invisible(.value)
  }, observable = <environment>, cacheHint = list(userExpr = {
    hybrid_chain(eventFunc(), function(value) {
        if (ignoreInit && !initialized) {
            initialized <<- TRUE
            req(FALSE)
        }
        req(!ignoreNULL || !isNullEvent(value))
        isolate(valueFunc())
    })
  }), class = c("reactive.event", "reactiveExpr", "reactive", "function"
))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
