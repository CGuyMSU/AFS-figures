#contains the ggplot2 package along with other packages
library(tidyverse) 
#package for combining figures
library(gridExtra)
#set working directory
setwd("~/Documents/Active My Files/Students/Hayley Glassic/Graphing manuscript") #sets working directory

#create some data for graphing purposes
length <- seq(from = 150, to = 500, by = 10) 
species <- c(rep("lmb", 36), rep("cat", 36))
par(mfrow=c(1,2))
a_lmb <- (-5.528) 
b_lmb <- 3.273
a_cat <- (-5.800)
b_cat <- (3.294)
weight_lmb <- 10^(a_lmb+b_lmb*log10(length))
weight_cat <- 10^(a_cat+b_cat*log10(length))
weight <- c(weight_lmb, weight_cat)
length_weight_data <- data.frame(species, length, weight)

#default ggplot graph with an annotated label
len_wt_default <- ggplot(length_weight_data, aes(x = length, y = weight, fill = species)) + 
  geom_point() +
  annotate("text", x=10, y=2000, label="A")
len_wt_default

#ggplot graph that meets AFS style guidelines
len_wt_afs <- ggplot(length_weight_data, aes(x = length, y = weight, fill = species)) +
  #symbol shape and size
  geom_point(shape = 21, size = 3) + 
  #adjusting ratio of the graph
  coord_fixed(.25) +
  #addint a B to the graph in the same font as the graph
  annotate("text", x = 120, y = 2100, label = "B", family = "Times New Roman", size = 8) +
  #setting the limits and tick breaks for the y-axis
  scale_y_continuous (limits = c(0,2200),expand = c(0,0),breaks = seq(0,2200,200)) +
  #setting the limits and tick spacing for the x-axis
  scale_x_continuous(limits = c(100,550),expand = c(0,0),breaks = seq(100,550,50)) +
  #adjust the order of the legend, making new labels, and selecting the symbol colors
  scale_fill_manual(limits = c("lmb", "cat"), labels = c("Largemouth bass", "Channel catfish"), values = c("black", "white")) + 
  #label for the y-axis
  ylab("Weight (g)") + 
  #label for the x-axis
  xlab("Length (mm)") +  
  #legend title left blank here because we want a legend but no title
  labs(fill = "") + 
  #makes the background white without grid lines
  theme_classic() + 
  #below are the theme setting that give you unlimited control of your figure and can be copied and pasted for many types of figures
  #sets the size, spacing, and color for the y-axis and x-axis titles
  theme (axis.title.y = element_text(size = 14, margin = margin(t = 0, r = 10, b = 0, l = 0), colour = "black"), 
         axis.title.x = element_text(size = 14, margin = margin(t = 10, r = 0, b = 0, l = 0), colour = "black"), 
         #sets the font type
         text = element_text(family = "Times New Roman"), 
         #positions the legend on the graph
         legend.position = c(0.4,0.85), 
         #legend background set to be blank
         legend.background = element_rect(), 
         #text in legend size
         legend.text = element_text(size = 12), 
         #sets the margin for the plot
         plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "cm"), 
         #sets the size of the tick marks for y-axis
         axis.ticks.y = element_line(size = 0.8),
         #sets the size of the tick marks for x-axis
         axis.ticks.x = element_line(size = 0.8), 
         #sets the length of the tick marks
         axis.ticks.length = unit(0.2,"cm"), 
         #sets the size and location of the tick labels for the x axis
         axis.text.y = element_text(colour = "black",size = 14, angle = 0, vjust = 0.5, hjust = 1, margin = margin(t = 0, r = 5, b = 0, l = 0)), 
         #sets the size and location of the tick labels for the x axis
         axis.text.x = element_text(colour = "black",size = 14, angle = 0, vjust = 0, hjust = 0.5, margin = margin(t = 5, r = 0, b = 0, l = 0)), 
         #the axes size, color, and end shape
         axis.line = element_line(colour = "black", size = 0.8, lineend = "square")) 
len_wt_afs

#arragnes the two plots side by side
new <- grid.arrange(len_wt_default,len_wt_afs, ncol = 2)

#saves the plot as a .tiff as a very large file
ggsave(file = "new.tiff", new, width = 14, height = 7, dpi=600) 









