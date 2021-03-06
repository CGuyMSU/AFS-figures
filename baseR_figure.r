#set working directory, you select this on your computer
setwd("your/directory/here")

#generate length and weight data for Channel Catfish and Largemouth Bass
length <- seq(from = 200, to = 500, by = 10)
#a and b values from Fisheries Techniques Ws equations
a_lmb <- (-5.528)
b_lmb <- 3.273
a_cat <- (-5.800)
b_cat <- (3.294)
weight_lmb <- 10^(a_lmb + b_lmb * log10(length))
weight_cat <- 10^(a_cat + b_cat * log10(length))

#begin .tiff file of the following two panel figure, finished and saved at line 45
tiff("baseR_figure.tiff", width = 20.32, height = 7.62, units = "cm", res = 300)
#one row, two panels
par(mfrow = c(1,2))

#make default plot
plot(length, weight_lmb)
#add points to default plot
points(length, weight_cat)
#add panel label A to default plot
mtext("A", at = min(length), adj = 0, line = 2, cex = 1.5)

#make custom figure that meets AFS style guidelines, first set plotting parameters (e.g., a serif font)
par(family = "Times New Roman", mar = c(3,4,2,2), mgp = c(3,.6,0))
#make custom plot
plot(length, weight_lmb, axes = FALSE, xlab = NA, ylab = NA, ylim = c(0,2400), xlim = c(100,600), pch = 19)
#add points for catfish
points(length, weight_cat, pch = 21, bg = "white")
#build x-axis
axis(1, pos = 0, at = seq(100,600, by = 100), lwd = 1.5)
#build y-axis
axis(2, pos = 100, at = seq(0,2400, by = 400), las = 1, lwd = 1.5)
#add x-axis label
mtext("Length (mm)", side = 1, line = 1.5)
#add y-axis label
mtext("Weight (g)", side = 2, line = 2)
#add panel label B to custom plot
mtext(expression(bold("B")), at = 100, adj = 0, line = 0, cex = 1.5, family = "Arial")
#add legend
legend(125, 2200, c("Largemouth Bass", "Channel Catfish"), pch = c(19,1), bty = "n")
#finish plot and save to disk
dev.off()
