library(ggplot2)

data <- read.csv("RW01-10_phyla_bubble_trimmed.csv", header = TRUE)

color_mapping <- setNames(unique(data$colour_code), unique(data$Phylum))

##### Create the Bubble Plot #####

bubble_plot <- ggplot(data, aes(x = GC_content, y = unmapped_read_proportion, size = total_counts, color = Phylum)) +
  geom_point(aes(alpha = ifelse(total_counts < 500000, 0.3, 0.7)), show.legend = TRUE) +
  scale_x_continuous(limits = c(25, 75), breaks = seq(20, 80, by = 10)) + 
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) + 
  scale_size_continuous(name = "Total Counts", range = c(3, 12)) +
  scale_alpha_continuous(guide = 'none') +
  scale_color_manual(values = color_mapping) +
  labs(title = "Bubble Plot of GC Content vs Mapped Read Proportion for Cyanobacteria",
       x = "GC Content (%)",
       y = "Mapped Read Proportion (%)",
       color = "Phylum") +  # Add labels and title
  theme_minimal() + 
  theme(axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) + 
  guides(color = guide_legend(override.aes = list(size = 5))) + 
  geom_text(data = subset(data, total_counts > 500000), aes(label = genus), color = "black", vjust = -1, size = 3, show.legend = FALSE) 

##### Display Plot #####

print(bubble_plot)
