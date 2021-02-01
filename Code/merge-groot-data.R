

################################################################################
### 1. Merge GRoot Data with species list of the Biodiversity Exploratories  ###
################################################################################

# prepare GRooT data
source("Code/GRooTExtraction.R")

# load species list
species.df <- read.table("DataFiles/species-list-exploratories.txt", sep ="\t",
                           header = TRUE)
# convert to vector
species.vector <- species.df[,1]

### check which GRooT species names are missing in the exploratories specie list

# combine genus and species, based on the TNRS species list (http://tnrs.iplantcollaborative.org/)
speciesTNRS <- with(GRooTAggregateSpeciesVersion, 
                    paste(genusTNRS, speciesTNRS, sep="_") 
                    )



species.df$is.TNRS.compatible <- !(species.list %in% speciesTNRS)  


write.table(species.df, "DataFiles/speciesdf.txt", sep="\t", quote = FALSE, row.names = FALSE)

write.table(unique(speciesTNRS), "DataFiles/speciesTNRS.txt", sep="\t", quote = FALSE, row.names = FALSE)



not.TNRS.compatible <- species.list[!(species.list %in% speciesTNRS)]




