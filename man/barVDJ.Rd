% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/barVDJ.R
\name{barVDJ}
\alias{barVDJ}
\alias{barVDJ,Matrix-method}
\alias{barVDJ,matrix-method}
\alias{barVDJ,clonoStats-method}
\title{Create a bar graph for clonotype expansion}
\usage{
barVDJ(x, ...)

\S4method{barVDJ}{Matrix}(x, title = NULL, legend = FALSE)

\S4method{barVDJ}{matrix}(x, ...)

\S4method{barVDJ}{clonoStats}(x, ...)
}
\arguments{
\item{x}{A \code{matrix} created with \code{clonoStats}.}

\item{...}{additional arguments.}

\item{title}{Character vector with an optional title. If FALSE, no title
is generated.}

\item{legend}{If TRUE, a legend will be included with the plot. If FALSE,
no legend is included in the plot.}
}
\value{
Returns a \code{ggplot} plot with a barplot that shows the
abundance of the clonotypes. The coloring indicates the number of cells
for each clonotype with darker colors being clonotypes with a single cell
(singletons) and lighter colors having more cells with that clonotype
(expanded clonotype).
}
\description{
\code{barVDJ} creates a barplot using ggplot that shows the
number of reads in the sample and colors the sample in accordance to the
amount of diversity.
}
\examples{
data('contigs')
x <- clonoStats(contigs)
barVDJ(x)

}
