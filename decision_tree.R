#Regression 
install.packages("readx")
install.packages("party")
library(party)
library(readxl)

data_carbon <- read.csv("C:/Users/benicio2/Box/CLASSES_UIUC/MASTER'S DEGREE/SPRING_2023/DIGITAL AGRICULTURE/carbon_data_biserial.csv")

# Create the tree.
output.tree <- ctree(
  TOC_mg_ha ~ compost_added + winter_cover_freq + cover_crop_type+cover_crop_seeding_rate, 
  data = data_carbon)

# Plot the tree.
plot(output.tree)

# Save the file.
dev.off()