install.packages("XML")
library(XML)

url = "data/tema1/cd_catalog.xml"

DocXML = xmlParse(url)
rootnode = xmlRoot(DocXML)
rootnode[1]

cds_data = xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))

cds.catalog = data.frame(t(cds_data), row.names = NULL)
cds.catalog[0:5,]

population = "data/tema1/WorldPopulation-wiki.htm"
tablas = readHTMLTable(population)

most_populated = tablas[[6]]