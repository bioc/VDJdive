#' @title Create a scatterplot for diversity evenness and abundance
#' @param ... additional arguments.
#' @name scatterVDJ
#' @export
setGeneric(name = "scatterVDJ",
           signature = "d",
           def = function(d, ...) standardGeneric("scatterVDJ"))

#' @rdname scatterVDJ
#' 
#' @description \code{scatterVDJ} creates a scatterplot that shows the 
#' abundance of the sample on the x-axis and the evenness on the y-axis. 
#' 
#' @param d A \code{matrix} created with \code{calculateDiversity}. The 
#' matrix must include nClonotypes and normentropy.
#' @param sampleGroups A \code{matrix} or \code{data.frame} that 
#' identifies the groups that each sample belongs to. The matrix must contain 
#' two columns. The first column lists the individual samples and should be 
#' called "Sample". The second column should list the group that each sample
#' belongs to (e.g. Normal and Tumor) and be called "Group". If no 
#' sampleGroups dataset is provided, all of the samples will be plotted
#' in the same color. 
#' @param title Character vector with an optional title. 
#' @param legend If TRUE, a legend will be included with the plot. If FALSE,
#' no legend is included in the plot.
#' 
#' @return Returns a \code{ggplot} plot with a scatterplot that shows the
#' abundance for each sample on the x-axis and the evenness for each sample
#' on the y-axis. Richness can be expressed as the total number of unique 
#' clonotypes in the sample or as the breakaway diversity measure (Willis and
#' Bunge 2015), which estimates the total number of unique clonotypes in the 
#' population. Evenness is measured as the normalized entropy, which 
#' is a measure of how evenly cells are distributed across the different 
#' clonotypes. Evenness is a measure between 0 and 1 that is independent of 
#' the number of cells in a sample. 
#' Diversity measures such as Shannon entropy contain information about 
#' both the evenness and the abundance of a sample, but because both 
#' characteristics are combined into one number, comparison between 
#' samples or groups of samples is difficult. Other measures, such as the
#' breakaway measure of diversity, only express the abundance of the sample
#' and not the evenness. The scatterplot shows how evenness and abundance 
#' differs between each sample and between each group of samples. 
#'
#' @examples
#' data(contigs)
#' x <- clonoStats(contigs)
#' d <- calculateDiversity(x)
#' sampleGroups <- data.frame(Sample = c("sample1", "sample2"), 
#'                            Group = c("Cancer", "Normal"))
#' scatterVDJ(x, d, sampleGroups = NULL, 
#'        title = "Evenness-abundance plot", legend = TRUE)
#' #' @title Create a scatterplot for diversity evenness and abundance
#' @param ... additional arguments.
#' @name scatterVDJ
#' @export
setGeneric(name = "scatterVDJ",
           signature = "d",
           def = function(d, ...) standardGeneric("scatterVDJ"))

#' @rdname scatterVDJ
#' 
#' @description \code{scatterVDJ} creates a scatterplot that shows the 
#' abundance of the sample on the x-axis and the evenness on the y-axis. 
#' 
#' @param d A \code{matrix} created with \code{calculateDiversity}. The 
#' matrix must include nClonotypes and normentropy.
#' @param sampleGroups A \code{matrix} or \code{data.frame} that 
#' identifies the groups that each sample belongs to. The matrix must contain 
#' two columns. The first column lists the individual samples and should be 
#' called "Sample". The second column should list the group that each sample
#' belongs to (e.g. Normal and Tumor) and be called "Group". If no 
#' sampleGroups dataset is provided, all of the samples will be plotted
#' in the same color. 
#' @param title Character vector with an optional title. 
#' @param legend If TRUE, a legend will be included with the plot. If FALSE,
#' no legend is included in the plot.
#' 
#' @return Returns a \code{ggplot} plot with a scatterplot that shows the
#' abundance for each sample on the x-axis and the evenness for each sample
#' on the y-axis. Richness can be expressed as the total number of unique 
#' clonotypes in the sample or as the breakaway diversity measure (Willis and
#' Bunge 2015), which estimates the total number of unique clonotypes in the 
#' population. Evenness is measured as the normalized entropy, which 
#' is a measure of how evenly cells are distributed across the different 
#' clonotypes. Evenness is a measure between 0 and 1 that is independent of 
#' the number of cells in a sample. 
#' Diversity measures such as Shannon entropy contain information about 
#' both the evenness and the abundance of a sample, but because both 
#' characteristics are combined into one number, comparison between 
#' samples or groups of samples is difficult. Other measures, such as the
#' breakaway measure of diversity, only express the abundance of the sample
#' and not the evenness. The scatterplot shows how evenness and abundance 
#' differs between each sample and between each group of samples. 
#'
#' @examples
#' data(contigs)
#' x <- clonoStats(contigs)
#' d <- calculateDiversity(x)
#' sampleGroups <- data.frame(Sample = c("sample1", "sample2"), 
#'                            Group = c("Cancer", "Normal"))
#' scatterVDJ(x, d, sampleGroups = NULL, 
#'        title = "Evenness-abundance plot", legend = TRUE)
#' 
#' @importFrom RColorBrewer brewer.pal
#' @importFrom ggplot2 ggplot aes geom_boxplot geom_jitter scale_color_manual theme_bw labs
#' @export
setMethod(f = "scatterVDJ",
          signature = signature(d = "matrix"),
          definition = function(d, sampleGroups = NULL, 
                                title = NULL, legend = FALSE){
            
            # if (colnames(d)) 
              
              if (!is.null(sampleGroups)) {
                sampleGroups <- data.frame(sampleGroups)
                colnames(sampleGroups) <- tolower(colnames(sampleGroups))
              }
            
          })

