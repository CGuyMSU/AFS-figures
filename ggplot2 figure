#load ggplot2 and other useful packages
library(tidyverse)
#load package for combining figures
library(gridExtra)

#set working directory, you select this on your computer
setwd("your/directory/here")

#generate length and weight data for Channel Catfish and Largemouth Bass, and put in dataframe
length <- seq(from = 200, to = 500, by = 10)
species <- c(rep("lmb", 31), rep("cat", 31))
a_lmb <- (-5.528)
b_lmb <- 3.273
a_cat <- (-5.800)
b_cat <- (3.294)
weight_lmb <- 10^(a_lmb + b_lmb * log10(length))
weight_cat <- 10^(a_cat + b_cat * log10(length))
weight <- c(weight_lmb, weight_cat)
length_weight_data <- data.frame(species, length, weight)

#make default ggplot figure with a legend and annotated label
len_wt_default <- ggplot(data = length_weight_data, aes(x = length, y = weight, fill = species)) + geom_point() +
labs(title = "A")
#view the plot, will appear in R plotting window
len_wt_default

#make ggplot figure that meets AFS style guidelines
len_wt_afs <- ggplot(data = length_weight_data, aes(x = length, y = weight, fill = species)) +
#set symbol shape and size
geom_point(shape = 21, size = 2) +
#set the limits and tick breaks for the y-axis
scale_y_continuous (limits = c(0,2400), expand = c(0,0), breaks = seq(0,2400,400)) +
#set the limits and tick spacing for the x-axis
scale_x_continuous(limits = c(100,600), expand = c(0,0), breaks = seq(100,600,100)) +
#adjust the order of the legend, make new labels, and select the symbol colors
scale_fill_manual(limits = c("lmb", "cat"), labels = c("Largemouth Bass", "Channel Catfish"),
      values = c("black", "white")) +
#add B to figure
ggtitle ("B") +
#label the y-axis
ylab("Weight (g)") +
#label the x-axis
xlab("Length (mm)") +
#add legend title, but left blank here because we want a legend but no title
labs(fill = "") +
#makes the figure background white without grid lines
theme_classic() +

#below are theme settings that provide unlimited control of your figure and can be a template for other figures
#set the size, spacing, and color for the y-axis and x-axis titles
theme (axis.title.y = element_text(size = 14, margin = margin(t = 0, r = 10, b = 0, l = 0), colour = "black"),
      axis.title.x = element_text(size = 14, margin = margin(t = 10, r = 0, b = 0, l = 0), colour = "black"),
      #set the font type
      text = element_text(family = "Times New Roman"),
      #modify plot title, the B in this case
      plot.title = element_text(face = "bold", family = "Arial"),
      #position the legend on the figure
      legend.position = c(0.3,0.85),
      #adjust size of text for legend
      legend.text = element_text(size = 12),
      #margin for the plot
      plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm"),
      #set size of the tick marks for y-axis
      axis.ticks.y = element_line(size = 0.5),
      #set size of the tick marks for x-axis
      axis.ticks.x = element_line(size = 0.5),
      #adjust length of the tick marks
      axis.ticks.length = unit(0.2,"cm"),
      #set size and location of the tick labels for the y axis
      axis.text.y = element_text(colour = "black", size = 14, angle = 0, vjust = 0.5, hjust = 1,
          margin = margin(t = 0, r = 5, b = 0, l = 0)),
      #set size and location of the tick labels for the x axis
      axis.text.x = element_text(colour = "black", size = 14, angle = 0, vjust = 0, hjust = 0.5,
          margin = margin(t = 5, r = 0, b = 0, l = 0)),
      #set the axis size, color, and end shape
      axis.line = element_line(colour = "black", size = 0.5, lineend = "square"))
      
#view the plot, will appear in R plotting window
len_wt_afs

#arragne the two plots side by side using the gridExtra package
ggplot_figure <- grid.arrange(len_wt_default, len_wt_afs, ncol = 2)

#save the plot as a .tiff as a very large file, which is publication quality
ggsave(ggplot_figure, file = "ggplot_figure.tiff", width = 20.32, height = 7.62, units = "cm", dpi = 300)
