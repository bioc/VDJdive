#' @include clonoStats_class.R
NULL

#' @title Create a bar graph for clonotype expansion
#' @param ... additional arguments.
#' @name barVDJ
#' @export
setGeneric(name = "barVDJ",
           signature = "x",
           def = function(x, ...) standardGeneric("barVDJ"))


#' @rdname barVDJ
#'
#' @description \code{barVDJ} creates a barplot using ggplot that shows the
#'   number of reads in the sample and colors the sample in accordance to the
#'   amount of diversity.
#' 
#' @param x A \code{matrix} created with \code{clonoStats}.
#' @param title Character vector with an optional title. If FALSE, no title
#' is generated.
#' @param legend If TRUE, a legend will be included with the plot. If FALSE,
#' no legend is included in the plot.
#' 
#' @return Returns a \code{ggplot} plot with a barplot that shows the
#' abundance of the clonotypes. The coloring indicates the number of cells
#' for each clonotype with darker colors being clonotypes with a single cell
#' (singletons) and lighter colors having more cells with that clonotype
#' (expanded clonotype).
#'
#' @examples
#' data('contigs')
#' x <- clonoStats(contigs)
#' barVDJ(x)
#' 
#' @importFrom ggplot2 ggplot geom_col aes scale_fill_continuous labs theme_bw
#' @import Matrix
#' @export
setMethod(f = "barVDJ",
          signature = signature(x = "Matrix"),
          definition = function(x, title = NULL, legend = FALSE) {
              dat <- NULL
              nms <- colnames(x)
              for (i in seq_len(ncol(x))) {
                  tmp <- x[x[, i] > 0.5, nms[i]]
                  tmp <- c(sort(tmp, decreasing = TRUE),0)
                  dat <- rbind(dat, data.frame(clonotype = seq_along(tmp), count = tmp, 
                                               sample = nms[i]))
              }
              g <- ggplot(dat, aes(x = sample, y = count, 
                                                     weight = count, fill = log(count)))
              
              if (legend) {
                  g <- g + geom_col(position = "stack")
              } else {
                  g <- g + geom_col(position = "stack", show.legend = FALSE)
              }
              
              g <- g +
                  scale_fill_continuous(type = "viridis") +
                  labs(x = NULL, y = "Number of T cells", title = title) +
                  theme_bw()
              g
          })

#' @rdname barVDJ
#' @export
setMethod(f = "barVDJ",
          signature = signature(x = "matrix"),
          definition = function(x, ...){
              barVDJ(Matrix(x), ...)
          })

#' @rdname barVDJ
#' @export
setMethod(f = "barVDJ",
          signature = signature(x = "clonoStats"),
          definition = function(x, ...){
              barVDJ(clonoAbundance(x), ...)
          })
