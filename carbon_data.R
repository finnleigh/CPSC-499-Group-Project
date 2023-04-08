library(car)
library(corrplot)
library(tidyverse)
c <- read.csv("carbon_data_biserial.csv")
y <- read.csv("yield_data_biserial.csv")
### changed categorical data into biserial data
# compost_added: yes = 1, no = 0
# winter_cover_freq: Every 4th winter = 1, Every winter = 4
# cover_crop_type: Rye = 1, Leg-rye = 2, Mustard = 3
# cover_crop_seeding_rate: 1x = 1, 3x = 3

# correlation plot
corr_val_c <- cor(c, method = "spearman")
corrplot(corr_val_c, method = "number", type = "upper")
corr_val_y <- cor(y, method = "spearman")
corrplot(corr_val_y, method = "number", type = "upper")

# boxplot - using originial categorical data
boxplot(TOC_mg_ha ~ compost_added, data = c)
c %>% kruskal.test(TOC_mg_ha ~ compost_added)
boxplot(TOC_mg_ha ~ winter_cover_freq, data = c)
c %>% kruskal.test(TOC_mg_ha ~ winter_cover_freq)
boxplot(TOC_mg_ha ~ cover_crop_type, data = c)
c %>% kruskal.test(TOC_mg_ha ~ cover_crop_type)
boxplot(TOC_mg_ha ~ cover_crop_seeding_rate, data = c)
c %>% kruskal.test(TOC_mg_ha ~ cover_crop_seeding_rate)
boxplot(TON_ma_ha ~ compost_added, data = c)
y %>% kruskal.test(TOC_mg_ha ~ compost_added)
boxplot(TON_ma_ha ~ winter_cover_freq, data = c)
y %>% kruskal.test(TOC_mg_ha ~ winter_cover_freq)
boxplot(TON_ma_ha ~ cover_crop_type, data = c)
y %>% kruskal.test(TOC_mg_ha ~ cover_crop_type)
boxplot(TON_ma_ha ~ cover_crop_seeding_rate, data = c)
y %>% kruskal.test(TOC_mg_ha ~ cover_crop_seeding_rate)


