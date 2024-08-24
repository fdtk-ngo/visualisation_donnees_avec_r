
# Faceting

pacman::p_load(
  tidyverse, questionr, ggstats
)

# charger les données
load("data/rp.Rdata")


p1 <- ggplot(data = rp, aes(x = cadres, y = chom)) +
  geom_point(alpha = 0.5)


p1 + 
  facet_grid(cols = vars(region))

# ajout de scales (free, free_x, free_y)
p1 + 
  facet_wrap(vars(region), 
             scales = "free") 

# ajout de rows avec pop_cl
ggplot(data = rp, aes(x = cadres, y = chom)) +
  geom_point(alpha = 0.5) + 
  facet_grid(cols = vars(region), rows = vars(pop_cl))

# ajouter l'argument scales = "free"

