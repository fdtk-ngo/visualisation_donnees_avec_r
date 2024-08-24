
# Thèmes

pacman::p_load(
  tidyverse, ggthemes
)

# charger les données
load("data/rp.Rdata")


p1 <- ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr, color = departement)) + 
  labs(title = "Parts des diplômés supérieurs et des ouvriers\n par département" , 
       x = "Part des diplômés supérieurs",
       y = "Part des ouvriers") 

p1 +
  theme(
    plot.title = element_text(size = 15, color = "darkblue"),
    panel.grid.minor = element_blank(),
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.position = "bottom"
  ) 




p2 <- ggplot(rp, aes(x = region, 
               fill = pop_cl, 
               by = pop_cl,
               label = scales::percent(after_stat(prop), accuracy = 0.1))) +
  geom_bar(position = "fill") + 
  geom_text(
    stat = "prop",
    position = position_fill(0.5)
  ) + 
  scale_y_continuous(labels = scales::percent)

p2


p2 +
  theme_light() +
  xlab("") +
  ylab("") +
  labs(fill = "Population") +
  ggtitle("Repartition des regions par tranche de la population") +
  theme(
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(size = 15),
    legend.position = "bottom"
  ) +
  scale_fill_brewer(palette = "Blues")



# plus de détails
?theme


p3 <- ggplot(data = rp) + 
  geom_bar(aes(x = departement, fill = departement), show.legend = F)


# ajout de size, angle et hjust
p3 +
  theme(
    axis.text.x = element_text(size = 15, angle = 45, hjust = 1)
  )


#  Les thèmes prédéfinis de ggplot2

p1 + 
  theme_bw()


p1 + 
  theme_classic()

p1 +
  theme_classic() + 
  theme(
    plot.title = element_text(size = 15, color = "darkblue"),
    panel.grid.minor = element_blank(),
    axis.title.x = element_text(size = 15), 
    axis.title.y = element_text(size = 15),
    axis.text = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.position = "bottom"
  ) 


p1 + 
  theme_minimal()


# Les thèmes avec ggthemes
p4 <- ggplot(economics) + 
  geom_line(aes(x = date, y = psavert)) + 
  ggtitle("Evolution du taux d'épargne personnel aux \nEtats-Unis de 1967 à 2015") + 
  xlab("Année") + 
  ylab("Taux d'épargne personnel")


p4 + 
  ggthemes::theme_economist()


p4 + 
  ggthemes::theme_fivethirtyeight()


p4 + 
  ggthemes::theme_excel_new()
  

p4 + 
  ggthemes::theme_stata()










