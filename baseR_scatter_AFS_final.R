setwd("~/Documents/Active My Files/Students/Hayley Glassic/Graphing manuscript")
#set your working directory
#generate length and weight data for Channel Catfish and Largemouth Bass
#fish lengths
length<-seq(from = 150, to = 500, by = 10) 
#a and b values from Fisheries Techniques Ws equations
a_lmb <- (-5.528) 
b_lmb <- 3.273
a_cat <- (-5.800)
b_cat <- (3.294)
weight_lmb <- 10^(a_lmb+b_lmb*log10(length))
weight_cat <- 10^(a_cat+b_cat*log10(length))

#output a .tiff fill of the following plot
tiff("baseR_figure.jpeg", width = 30.48,
     height = 22.86, units = "cm", res = 200)
#one row, two panels
par(mfrow=c(1,2))
#default plot
plot(length, weight_lmb)
#add points to default plot
points(length,weight_cat)
#add text
mtext("A", 
      at = min(length), adj = 0, line = 2,
      cex = 1.5)
#set plotting parameters for plot to meet AFS style guide
par(family = "Times New Roman", 
    mar = c(3,4,2,2),
    mgp = c(3,.7,0))
plot(length, weight_lmb, 
     # suppress axis
     axes = FALSE,
     #label x
     xlab = NA, 
     #label y 
     ylab = NA, 
     #set y-limit
     ylim=c(0,2200), 
     #set x-limit for plot region
     xlim=c(100,550),
     #closed plotting symbol 
     pch=19)
#add points
points(length, weight_cat)
#build x-axis
axis(1, pos = 0, at = seq(100,550, by = 50))
#build y-axis
axis(2, pos = 100, at = seq(0, 2200, by = 200), las = 1)
#add x-axis label
mtext("Length (mm)", side = 1, line = 0.5)
#add y-axis label
mtext("Weight (g)", side = 2, line = 2)
#add a text to figure
mtext(expression(bold("B")), 
      at = 0, adj = 0, line = 0,
      cex = 1.5, family = "Times New Roman")
#add legend
legend(125,2000,c("Largemouth Bass", "Channel Catfish"),
       pch = c(19,1), bty = "n")
#finish plot and save to disk
dev.off()

