% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{summarizeClonotypes}
\alias{summarizeClonotypes}
\alias{summarizeClonotypes,Matrix-method}
\alias{summarizeClonotypes,SingleCellExperiment-method}
\alias{summarizeClonotypes,matrix-method}
\alias{summarizeClonotypes,clonoStats-method}
\title{Get sample-level clonotype counts}
\usage{
summarizeClonotypes(x, by, ...)

\S4method{summarizeClonotypes}{Matrix}(
  x,
  by,
  mode = c("sum", "tab"),
  lang = c("r", "cpp"),
  BPPARAM = SerialParam()
)

\S4method{summarizeClonotypes}{SingleCellExperiment}(
  x,
  by = "sample",
  contigs = "contigs",
  clonoStats = "clonoStats",
  ...
)

\S4method{summarizeClonotypes}{matrix}(x, by, ...)

\S4method{summarizeClonotypes}{clonoStats}(x, by, ...)
}
\arguments{
\item{x}{A (usually sparse) matrix of cell-level clonotype counts (cells are
rows and clonotypes are columns). Alternatively, a
\code{\link[SingleCellExperiment]{SingleCellExperiment}} with such a matrix
stored in the \code{colData}.}

\item{by}{A character vector or factor by which to summarize the clonotype
counts. If \code{x} is a \code{SingleCellExperiment} object, this can also
be a character, giving the name of the column from the \code{colData} to
use as this variable. Similar to the \code{group} argument for
\code{\link{clonoStats}}.}

\item{...}{additional arguments.}

\item{mode}{Type of summarization to perform. Default is \code{'sum'}, which
sums clonotype abundances within each sample (or level of \code{'by'}).
Alternative is \code{'tab'}, which constructs a table of clonotype
frequencies (ie. singletons, doubletons, etc.) by sample.}

\item{lang}{Indicates which implementation of the \code{"tab"} summarization
to use. Options are \code{'r'} (default) or \code{'cpp'}. Only used if
non-integer clonotype abundances are present and \code{mode = "tab"}.}

\item{BPPARAM}{A \linkS4class{BiocParallelParam} object specifying the
parallel backend for distributed clonotype assignment operations (split by
\code{group}). Default is \code{BiocParallel::SerialParam()}.}

\item{contigs}{character. If \code{x} is a \code{SingleCellExperiment}, the
name of the \code{SplitDataFrameList} in the \code{colData} of \code{x}
containing contig information.}

\item{clonoStats}{character. If \code{x} is a \code{SingleCellExperiment},
the name of the element in the \code{metadata} of \code{x} that contains
the output of \code{clonoStats}. Must include cell-level clonotype
assignments (ie. \code{assignment = TRUE}).}
}
\value{
If \code{mode = 'sum'}, returns a matrix clonotype abundances where
each row corresponds to a clonotype and each column a value of \code{by}
(if \code{by} denotes sample labels, this is a matrix of sample-level
clonotype counts). If \code{mode = 'tab'}, returns a matrix of clonotype
frequencies, where each row corresponds to a frequency (singletons,
doubletons, etc.) and each column a value of \code{by}.
}
\description{
Takes a matrix of cell-level clonotype counts and sums them
within groups (typically samples).
}
\examples{
example(addVDJtoSCE)
x <- clonoStats(contigs, assignment = TRUE)
summarizeClonotypes(x, by = sce$sample)

}
