
# cell-level counts by sample
#' @title Split cell-level clonotype counts by sample
#' @name splitClonotypes
#' @param ... additional arguments.
#' @export
setGeneric(name = "splitClonotypes",
           signature = c("x","by"),
           def = function(x, by, ...) standardGeneric("splitClonotypes"))

#' @rdname splitClonotypes
#' 
#' @description Takes a matrix of cell-level clonotype counts and splits them
#'   into a list of group-specific counts (typically samples).
#' 
#' @param x A \code{Matrix} of cell-level clonotype assignments
#'   (cells-by-clonotypes) or a \code{SingleCellExperiment} object with such a
#'   matrix stored in the \code{clono} slot of the \code{colData}.
#' @param by A character vector or factor by which to split the clonotype
#'   counts. If \code{x} is a \code{SingleCellExperiment} object, this can also
#'   be a character, giving the name of the column from the \code{colData} to
#'   use as this variable.
#'   
#' @return A list of \code{Matrix} objects providing the cell-level counts for
#'   each unique value of \code{by} (if \code{by} denotes sample labels, each
#'   matrix in the list will contain the cells from a single sample).
#' 
#' @examples 
#' example(addVDJtoSCE)
#' sce <- EMquant(sce, sample = "sample")
#' sampleCountsList <- splitClonotypes(sce, by = "sample")
#' 
#' @importClassesFrom Matrix Matrix
#' @export
setMethod(f = "splitClonotypes",
          signature = signature(x = "Matrix"),
          definition = function(x, by){
              stopifnot(length(by) == nrow(x))
              out <- lapply(sort(unique(by)), function(lv){
                  x[which(by == lv), ,drop = FALSE]
              })
              names(out) <- as.character(sort(unique(by)))
              return(out)
          })


#' @rdname splitClonotypes
#' @importFrom Matrix Matrix
#' @export
setMethod(f = "splitClonotypes",
          signature = signature(x = "matrix"),
          definition = function(x, by){
              splitClonotypes(Matrix(x), by)
          })

#' @rdname splitClonotypes
#' @param clonoCol The name of the column in the \code{colData} of \code{x} that
#'   contains the cell-level clonotype assignments (only applies if \code{x} is a
#'   \code{SingleCellExperiment}).
#' @importClassesFrom SingleCellExperiment SingleCellExperiment
#' @export
setMethod(f = "splitClonotypes",
          signature = signature(x = "SingleCellExperiment"),
          definition = function(x, by, clonoCol = 'clono'){
              if(is.null(x$clono)){
                  stop('No clonotype counts found.')
              }
              if(length(by) == 1){
                  byVar <- factor(x[[by]])
              }else{
                  stopifnot(length(by) == ncol(x))
                  byVar <- factor(by)
              }
              return(splitClonotypes(x$clono, byVar))
          })


#' @title Get sample-level clonotype counts
#' @name summarizeClonotypes
#' @param ... additional arguments.
#' @export
setGeneric(name = "summarizeClonotypes",
           signature = c("x","by"),
           def = function(x, by, ...) standardGeneric("summarizeClonotypes"))

#' @rdname summarizeClonotypes
#' 
#' @description Takes a matrix of cell-level clonotype counts and sums them
#'   within groups (typically samples).
#' @param x A (usually sparse) matrix of cell-level clonotype counts (cells are
#'   rows and clonotypes are columns). Alternatively, a
#'   \code{\link[SingleCellExperiment]{SingleCellExperiment}} with such a matrix
#'   stored in the \code{colData}.
#' @param by A character vector or factor by which to summarize the clonotype
#'   counts. If \code{x} is a \code{SingleCellExperiment} object, this can also
#'   be a character, giving the name of the column from the \code{colData} to
#'   use as this variable.
#' @param clonoCol A character providing the name of the cell-level clonotype
#'   counts matrix in the \code{colData} of \code{x} (default = \code{'clono'}).
#'   Only applies when \code{x} is a \code{SingleCellExperiment} object.
#'   
#' @return A matrix clonotype counts where each row corresponds to a unique
#'   value of \code{by} (if \code{by} denotes sample labels, this is a matrix of
#'   sample-level clonotype counts).
#' 
#' @examples 
#' example(addVDJtoSCE)
#' sce <- EMquant(sce, sample = "sample")
#' sampleLevelCounts <- summarizeClonotypes(sce, by = "sample")
#' 
#' @export
setMethod(f = "summarizeClonotypes",
          signature = signature(x = "Matrix"),
          definition = function(x, by){
              stopifnot(length(by) == nrow(x))
              by <- factor(by)
              out <- t(sapply(sort(unique(by)), function(lv){
                  colSums(x[which(by == lv), ,drop = FALSE])
              }, USE.NAMES = TRUE))
              rownames(out) <- as.character(sort(unique(by)))
              return(out)
          })

#' @rdname summarizeClonotypes
#' @importClassesFrom SingleCellExperiment SingleCellExperiment
#' @export
setMethod(f = "summarizeClonotypes",
          signature = signature(x = "SingleCellExperiment"),
          definition = function(x, by, clonoCol = 'clono'){
              if(is.null(x[[clonoCol]])){
                  stop('No clonotype counts found.')
              }
              if(length(by) == 1){
                  byVar <- factor(x[[by]])
              }else{
                  byVar <- factor(by)
              }
              out <- summarizeClonotypes(x[[clonoCol]], byVar)
              return(out)
          })

#' @rdname summarizeClonotypes
#' @importFrom Matrix Matrix
#' @export
setMethod(f = "summarizeClonotypes",
          signature = signature(x = "matrix"),
          definition = function(x, by){
              summarizeClonotypes(Matrix(x), by)
          })



#' @title Example V(D)J contig data
#' @name example_contigs
#'
#' @usage data("example_contigs")
#'
#' @description This is a small dataset consisting of 24 cells from 2 samples,
#'   meant to demonstrate how certain functions in the \code{TCRseq} package
#'   work.
#'
#' @format A \code{SplitDataFrameList} object of length 24.
#' 
#' @source An extremely small subset of the TCR data from Braun, et al. (2020).
#'
#' @examples
#' data("example_contigs")
#' contigs
#' 
"contigs"