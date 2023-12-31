% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scatterVDJ.R
\name{scatterVDJ}
\alias{scatterVDJ}
\alias{scatterVDJ,matrix-method}
\title{Create a scatterplot for diversity evenness and abundance}
\usage{
scatterVDJ(d, ...)

\S4method{scatterVDJ}{matrix}(d, sampleGroups = NULL, title = NULL, legend = FALSE)
}
\arguments{
\item{d}{A \code{matrix} created with \code{calculateDiversity}. The
matrix must include nClonotypes and normentropy.}

\item{...}{additional arguments.}

\item{sampleGroups}{A \code{matrix} or \code{data.frame} that
identifies the groups that each sample belongs to. The matrix must contain
two columns. The first column lists the individual samples and should be
called "Sample". The second column should list the group that each sample
belongs to (e.g. Normal and Tumor) and be called "Group". If no
sampleGroups dataset is provided, all of the samples will be plotted
in the same color.}

\item{title}{Character vector with an optional title.}

\item{legend}{If TRUE, a legend will be included with the plot. If FALSE,
no legend is included in the plot.}
}
\value{
Returns a \code{ggplot} plot with a scatterplot that shows the
abundance for each sample on the x-axis and the evenness for each sample
on the y-axis. Richness can be expressed as the total number of unique
clonotypes in the sample or as the breakaway diversity measure (Willis and
Bunge 2015), which estimates the total number of unique clonotypes in the
population. Evenness is measured as the normalized entropy, which
is a measure of how evenly cells are distributed across the different
clonotypes. Evenness is a measure between 0 and 1 that is independent of
the number of cells in a sample.
Diversity measures such as Shannon entropy contain information about
both the evenness and the abundance of a sample, but because both
characteristics are combined into one number, comparison between
samples or groups of samples is difficult. Other measures, such as the
breakaway measure of diversity, only express the abundance of the sample
and not the evenness. The scatterplot shows how evenness and abundance
differs between each sample and between each group of samples.
}
\description{
\code{scatterVDJ} creates a scatterplot that shows the
abundance of the sample on the x-axis and the evenness on the y-axis.
}
\examples{
data('contigs')
x <- clonoStats(contigs)
d <- calculateDiversity(x)
sampleGroups <- data.frame(Sample = c("sample1", "sample2"), 
                           Group = c("Cancer", "Normal"))
scatterVDJ(d, sampleGroups = NULL, 
       title = "Evenness-abundance plot", legend = TRUE)

}
