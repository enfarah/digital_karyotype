#Load in libraries
library(tidyr)
library(dplyr)
library(readr)

#Load in data
data = read.delim("~/Dropbox (UCSD)/SNP array data/FinalReport.txt", skip = 9)

#set variables
chr = unique(data$Chr)
sample = unique(data$Sample.ID)

#Nested for loops to go through all the samples, and for each sample make jpgs for all the chromosomes

for(i in sample){
	#Go through each sample
  sampleData = data %>% filter(Sample.ID == i)
	for(j in chr){
		#Go through each chromosome
	  chrData = sampleData %>% filter(Chr == j)
	  jpeg(paste0("~/Desktop/karyotype/plots/sample", i, "chr", j, ".jpg"), height = 800, width = 1600,    pointsize = 20)
	  plot(chrData$Position,chrData[,'Log.R.Ratio'],ylim=c(-2,2),col='red',xlab = '',ylab = '',pch=20)
    par(new=T)
    plot(chrData$Position,chrData[,"B.Allele.Freq"],ylim=c(0,1),col='blue',xlab='',ylab = '', xaxt= 'n', yaxt='n',pch=20)
    axis(4)
    dev.off()
	}
}