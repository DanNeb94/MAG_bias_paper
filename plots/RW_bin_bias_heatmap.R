install.packages("pheatmap")
library(pheatmap)

##### Prepare data ##### 

dat.z <- read.csv("binning_efficiency.csv", sep=",", header = TRUE, row.names = 1)
my_colors <- colorRampPalette(c("white", "red"))(100)
breaks <- seq(0, 100, length.out = 102)


##### Create Heatmap #####

pheatmap(dat.z,
         scale = "none",
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         color = my_colors,  # Use your custom color scale
         display_numbers = TRUE,
         breaks = breaks)

svg("svg_heatmap_test.svg", width = 15, height = 5)