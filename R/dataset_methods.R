#' @title List the datasets currently in the DB
#' @export
#'
#' @description Returns a list of datasets
#'
#' @param api a \code{\link{mangalapi}} object
#' @param ... additional parameters (filters) to be passed to \code{\link{mangalList}}
listDataset <- function(api, ...) mangalList(api, 'dataset', ...)

#' @title Get a particular dataset
#' @export
#'
#' @description Returns a dataset object
#'
#' @param api a \code{\link{mangalapi}} object
#' @param id the identifier of a dataset
getDataset <- function(api, id) mangalGet(api, 'dataset', id)

#' @title Add a new dataset
#' @export
#' 
#' @description Post a new dataset to the database
#' 
#' @details
#' Requires authentication
#' 
#' @param api a \code{\link{mangalapi}} object
#' @param data the dataset in list format
addDataset <- function(api, data)
{
	data$networks <- multi_resToURI(api, data$networks, 'network')
	if(!is.null(data$papers)) data$papers <- multi_resToURI(api, data$papers, 'reference')
	if(!is.null(data$data)) data$data <- multi_resToURI(api, data$data, 'reference')
	if(!is.null(data$environment)) data$environment <- multi_resToURI(api, data$environment, 'environment')
	mangalPost(api, 'dataset', data)
}

#' @title Patch a dataset
#' @export
#' 
#' @description Patch a dataset from the database
#' 
#' @details
#' Requires authentication
#' 
#' @param api a \code{\link{mangalapi}} object
#' @param data the dataset in list format
patchDataset <- function(api, data)
{
	data$networks <- multi_resToURI(api, data$networks, 'network')
	if(!is.null(data$papers)) data$papers <- multi_resToURI(api, data$papers, 'reference')
	if(!is.null(data$data)) data$data <- multi_resToURI(api, data$data, 'reference')
	if(!is.null(data$environment)) data$environment <- multi_resToURI(api, data$environment, 'environment')
	mangalPatch(api, 'dataset', data)
}
