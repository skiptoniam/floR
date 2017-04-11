#' #' @useDynLib floR
#' #' @importFrom Rcpp sourceCpp
#' NULL

#' @title floR package
#' @name floR-package
#' @description floR is an R package to implement circuit theory-based connectivity for dynamic meta-population models
#' @docType package
NULL

#' @title flowr objects
#' @rdname flowr
#' @name flowr
#' @description A wrapper function around the groovy 'GFlow' software to using in dynamic metapopulation models.
#' @param habitat A habitat map or resistance surface, this need to be a raster (.asc).
#' @param populations A set focal nodes or source/destination populations (.txt list of point pairs to calculate or .asc grid).
#' Inputs must be points.
#' @param output_format The required output format, the default is a raster.
#' @param output_dir Directory to save output results.
#' @param cores The numer of processes to run in parallel. Default is four.
#' @param control A list of optional calls, see details for instructions.
#'
#' @details Control parameters that can be called as optional extras.
#' \itemize{
#'  \item{output_sum_density_filename}{Logical Set Output Path, file name, and format of cumulative current density. Omitting this flag will discard current density summation.}
#'  \item{node_pairs}{Calculate only desired node pairs if input (e.g., "${OUTPUT_DIR}/shuf.tsv" from gshuf above). Currently not used.}
#'  \item{converge_at}{Set Convergence Factor to stop calculating. Typically used in place of 'node_pairs' or if all pairwise is too computationlly time consuing. Acceptable formats include: '4N' or '.9999'. Set to '1N' Below.}
#'  \item{shuffle_node_pairs}{Shuffles pairs for random selection. Input is binary. Currently set to shuffle below (= 1)}
#'  \item{effective_resistance}{Print effective resistance to log file. Supply path for .csv}
#'}

# which mpiexec
#
# # Set and add PETSc to PATH (Please update this if you are using Linux or any installation proceedure that differs from the README)
# export PETSC_DIR=/usr/local/Cellar/petsc/3.7.3/real
# export LD_LIBRARY_PATH=${PETSC_DIR}/lib:$LD_LIBRARY_PATH
#
# # Set Output Directory: Default is Current Directory
# OUTPUT_DIR=.
#
# # DEBUG: Set number of random pairs to calculate from all possible pairs (Currently -n=5). Must be used with -node_pairs flag
# # Allows exact number of test pairs. Remove or comment line for all pairwise. Requires 'coreutils' and 'all.tsv' from inputs.
# # gshuf all.tsv -n 5 > ${OUTPUT_DIR}/shuf.tsv
#
# # Set the Clock
# SECONDS=0
# date
#
# # Assigning Arguments to Flags for Execution:
#
# mpiexec -n 4 ./gflow.x \
# -habitat resistance.asc \
# -nodes nodes \
# -converge_at 1N \
# -shuffle_node_pairs 1 \
# -effective_resistance ./R_eff.csv \
# -output_sum_density_filename ./{time}_local_sum_{iter}.asc \
#
#
# : "walltime: $SECONDS seconds"
#

# Looks like i'll need to call Rmpi to integrate R to mpi cluster.
# install.packages("devtools")
# library(devtools)
# install_github("jtilly/taoR") - required for <petsc.h>
# need to install mpi too. Looks like this will be a lot easier to develop on linux.

flowr <- function(habitat, populations, output_format="asc", output_dir = "./", cores=4, control=list()){

         # test <- .Call( "gflow", as.numeric( y), as.numeric( mu.N), as.numeric( mu.Z), as.numeric( alpha), as.integer(LOG),PACKAGE="floR")

}

