
# plotly

pacman::p_load(
  tidyverse, plotly
)

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

p2 <- ggplot(economics) + 
  geom_line(aes(x = date, y = psavert)) + 
  ggtitle("Evolution du taux d'épargne personnel aux \nEtats-Unis de 1967 à 2015") + 
  xlab("Année") + 
  ylab("Taux d'épargne personnel") + 
  ggthemes::theme_fivethirtyeight()

p2

# plotly
ggplotly(p1)

ggplotly(p2)



