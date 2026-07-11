#' ChEBI entry class.
#'
#' This is the entry class for ChEBI database.
#'
#' @examples
#' # Create an instance with default settings:
#' mybiodb <- biodb::newInst()
#'
#' # Check if ChEBI SOAP service is available
#' if (tryCatch({
#'     url <- "https://www.ebi.ac.uk/webservices/chebi/2.0/webservice?wsdl"
#'     res <- RCurl::getURL(url, .opts = list(timeout = 5, connecttimeout = 5))
#'     grepl("^\\s*<\\?xml|<wsdl:definitions", res)
#' }, error = function(e) FALSE)) {
#'     # Load package definitions:
#'     if ( ! mybiodb$getDbsInfo()$isDefined('chebi')) {
#'         mybiodb$loadDefinitions(system.file("definitions.yml", package='biodbChebi'))
#'     }
#'
#'     # Create a connector to ChEBI
#'     conn <- mybiodb$getFactory()$createConn('chebi')
#'
#'     # Get an entry
#'     e <- conn$getEntry('15440')
#' }
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @importFrom R6 R6Class
#' @export
ChebiEntry <- R6::R6Class("ChebiEntry",
    inherit=biodb::BiodbXmlEntry
)
