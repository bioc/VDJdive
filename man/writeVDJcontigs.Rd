% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup.R
\name{writeVDJcontigs}
\alias{writeVDJcontigs}
\alias{writeVDJcontigs,character,SplitDataFrameList-method}
\title{Write V(D)J contig data in 10X format}
\usage{
writeVDJcontigs(path, x, ...)

\S4method{writeVDJcontigs}{character,SplitDataFrameList}(path, x)
}
\arguments{
\item{path}{A string containing the path to the output directory.}

\item{x}{A \code{SplitDataFrameList} object containing V(D)J contig
information, split by cell barcodes, as created by \code{readVDJcontigs}.}

\item{...}{additional arguments.}
}
\value{
Creates various subdirectories of the directory specified in \code{path}.
Each subdirectory is named for a sample found in the dataset, \code{x}, and
contains a CSV filed named \code{filtered_contig_annotations.csv}.
}
\description{
Write V(D)J data to a series of directories, each containing a
CSV file with the data for an individual sample.
}
\examples{
data('contigs')
loc <- tempdir()
writeVDJcontigs(loc, contigs)

}
