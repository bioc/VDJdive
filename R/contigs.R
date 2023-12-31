#' SplitDataFrameList containing AIRR-seq (TCR) data for six cells
#'
#' Data are a small subset of the TCR-seq data from the paper, "Progressive
#' immune dysfunction with advancing disease stage in renal cell carcinoma"
#' (Braun et al. 2021). The full dataset can be obtained from dbGap
#' phs002252.v1.p1.
#'
#' @format A SplitDataFrameList with six elements. Each list element
#' contains the TCR-seq data for a single cell in a \code{DFrame}.
#' Each \code{DFrame} has 19 variables and as many rows as there
#' are contigs for the cell.
#'
#' The variables in the dataset are the same as those in the
#' contig_annotations.csv file created by 10X. The meaning of each
#' variable label is specified at
#' https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/output/annotation,
#' but they are also summarized below:
#' \describe{
#' \item{barcode}{Cell barcode for the contig in the list element.}
#' \item{is_cell}{True or False value indicating whether the barcode was
#' called as a cell.}
#' \item{contig_id}{Unique identifier for this contig.}
#' \item{high_confidence}{True or False value indicating whether the
#' contig was called as high-confidence (unlikely to be a chimeric
#' sequence or some other artifact).}
#' \item{length}{The contig sequence length in nucleotides.}
#' \item{chain}{The chain associated with this contig; for example, TRA,
#' TRB, IGK, IGL, or IGH. A value of "Multi" indicates that segments
#' from multiple chains were present.}
#' \item{v_gene}{The highest-scoring V segment, for example, TRAV1-1.}
#' \item{d_gene}{The highest-scoring D segment, for example, TRBD1.}
#' \item{j_gene}{The highest-scoring J segment, for example, TRAJ1-1.}
#' \item{c_gene}{The highest-scoring C segment, for example, TRAC.}
#' \item{full_length}{If the contig was declared as full-length.}
#' \item{productive}{If the contig was declared as productive.}
#' \item{cdr3}{The predicted CDR3 amino acid sequence.}
#' \item{cdr3_nt}{The predicted CDR3 nucleotide sequence.}
#' \item{reads}{The number of reads aligned to this contig.}
#' \item{umis}{The number of distinct UMIs aligned to this contig.}
#' \item{raw_clonotype_id}{The ID of the clonotype to which this cell barcode
#' was assigned.} \item{raw_consensus_id}{The ID of the consensus sequence to
#' which this contig was assigned.}
#' \item{sample}{Sample identifier. The data for contigs come from two
#' different samples.}
#' }
#' 
#' @usage data(contigs)
#' @examples
#' data('contigs')
#' x <- clonoStats(contigs)
#' 
#' @source Braun, David A., et al. "Progressive
#' immune dysfunction with advancing disease stage in renal cell carcinoma."
#' Cancer cell 39, no. 5 (2021): 632-648.
"contigs"
