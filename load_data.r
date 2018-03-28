### Loading in Data Set - Refer to 01. EDA for more details
ames_URL <- 'https://ww2.amstat.org/publications/jse/v19n3/decock/AmesHousing.txt'
ames <- read.table(url(ames_URL), sep = '\t', header = TRUE)

ames$Order <- NULL
ames$PID <- NULL

to_be_factors <- c("MS.SubClass", "Overall.Qual", "Overall.Cond", "Bsmt.Full.Bath", "Bsmt.Half.Bath", "Full.Bath", 
                   "Half.Bath", "Bedroom.AbvGr", "Kitchen.AbvGr", "TotRms.AbvGrd", "Fireplaces", "Garage.Cars", "Mo.Sold",
                   "Yr.Sold", "Year.Built", "Year.Remod.Add")
ames[to_be_factors] <- lapply(ames[to_be_factors], factor)

ames$Lot.Frontage[is.na(ames$Lot.Frontage)] <- mean(ames$Lot.Frontage, na.rm=TRUE)
ames$Mas.Vnr.Area[is.na(ames$Mas.Vnr.Area)] <- mean(ames$Mas.Vnr.Area, na.rm=TRUE)
ames$Garage.Yr.Blt[is.na(ames$Garage.Yr.Blt)] <- mean(ames$Garage.Yr.Blt, na.rm=TRUE)

empty_means_without <-c("Alley","Bsmt.Qual","Bsmt.Cond","Bsmt.Exposure","BsmtFin.Type.1", "BsmtFin.Type.2", "Fireplace.Qu",
                        "Garage.Type","Garage.Finish", "Garage.Qual","Garage.Cond","Pool.QC","Fence","Misc.Feature")

replace_empty_with_without <- function(feature) {
    levels(feature) <- c(levels(feature), "Without")
    feature[is.na(feature)] <- "Without"
    return(feature)
}

for (feature in empty_means_without) {
    ames[,feature] <- replace_empty_with_without(ames[,feature])
}

ames <- na.omit(ames)