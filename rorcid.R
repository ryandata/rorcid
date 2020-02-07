install.packages("rorcid")
install.packages("rcrossref")
library(rorcid)
library(rcrossref)

myorcids <- c("0000-0002-9847-5949", "0000-0003-4873-4268", "0000-0001-5425-7424" )

orcid_auth()

orcid_person("0000-0003-4873-4268")
as.orcid("0000-0003-4873-4268") 
orcid_citations("0000-0003-4873-4268")
orcid_works(myorcids)
works(orcid_id("0000-0003-4873-4268"))

library(help="rorcid")

myworks<-as.data.frame(orcid_works("0000-0003-4873-4268"))
# write.csv(myworks, "myworks.csv")

my_dois <- rorcid::identifiers(rorcid::works("0000-0003-4873-4268"))
pubs <- rcrossref::cr_cn(dois = my_dois, format = "bibtex")
invisible(lapply(pubs, write, "pubs.bib", append=TRUE))
