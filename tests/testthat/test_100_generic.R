# Check if ChEBI SOAP service is available
if (!tryCatch({
    url <- "https://www.ebi.ac.uk/webservices/chebi/2.0/webservice?wsdl"
    res <- RCurl::getURL(url)
    grepl("^\\s*<\\?xml|<wsdl:definitions", res)
}, error = function(e) {
    FALSE
})) {
    testthat::skip("ChEBI SOAP web service is not available (retired)")
}

# Set test context
biodb::testContext("Generic tests")

# Instantiate Biodb
biodb <- biodb::createBiodbTestInstance(ack=TRUE)

# Load package definitions
defFile <- system.file("definitions.yml", package='biodbChebi')
biodb$loadDefinitions(defFile)

# Create connector
conn <- biodb$getFactory()$createConn('chebi')

# Run generic tests
testRefFolder <- system.file("testref", package='biodbChebi')
biodb::runGenericTests(conn, pkgName='biodbChebi',
    testRefFolder=testRefFolder, opt=list(max.results=1))

# Terminate Biodb
biodb$terminate()
