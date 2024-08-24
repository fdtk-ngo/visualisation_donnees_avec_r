
# Exporter un graphique

library(tidyverse)

# charger les données
load("data/rp.Rdata")



p1 <- ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr, color = departement)) + 
  labs(title = "Parts des diplômés supérieurs et des ouvriers\n par département" , 
       x = "Part des diplômés supérieurs",
       y = "Part des ouvriers") +
  theme(
    plot.title = element_text(size = 15, color = "darkblue"),
    panel.grid.minor = element_blank(),
    axis.title.x = element_text(size = 15), 
    axis.title.y = element_text(size = 15),
    axis.text = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.position = "bottom"
  ) 

p1

ggsave(plot = p1, filename = "plots/plot1.png", width = 10, height = 8)

ggsave(plot = p1, filename = "plots/plot1.pdf", width = 10, height = 8)
