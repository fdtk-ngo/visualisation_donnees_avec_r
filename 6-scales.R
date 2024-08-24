
# Scales

library(tidyverse)

# charger les données
load("data/rp.Rdata")

## scale_size
p1 <- ggplot(rp) +
  geom_point(aes(x = dipl_sup, y = cadres, size = pop_tot), alpha = 0.6)

p1

p1 +
  scale_size("Population", range = c(0, 15))


# ajout de breaks et labels
p1 +
  scale_size(
    "Population",
    range = c(0, 15),
    breaks = c(1000, 5000, 10000, 50000),
    labels = c("<1000", "1000-5000", "5000-9999", "10000-50000")
  )


# Les scales des axes (scale_x, scale_y)
(
  p2 <- ggplot(rp) +
  geom_bar(aes(x = region))
  )

p2 + 
  scale_x_discrete("Region", 
                   limits = c("Provence-Alpes-Côte d'Azur", 
                              "Hauts-de-France", 
                              "Auvergne-Rhône-Alpes")) + 
  # éliminer l'espace en bas des barres
  scale_y_continuous(expand = c(0, 0))


# scale_x_continuous et scale_y_continuous
p3 <- ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr)) 

p3 + 
  scale_x_continuous("Pourcentage des diplômés du supérieur", limits = c(0, 50)) + 
  scale_y_continuous("Pourcentage des ouvriers", limits = c(0, 50))


# scale_x_log10 et scale_y_log10
p3 + 
  scale_x_log10() + 
  scale_y_log10()



# scale_color et scale_fill

#Variable qualitative
p4 <- ggplot(data = rp) + 
  geom_bar(aes(x = departement, 
               fill = departement), 
           show.legend = F)

p4

p4 + 
  scale_fill_brewer()

RColorBrewer::display.brewer.all()

p4 + 
  scale_fill_brewer(palette = "BrBG")


p5 <- ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr, color = departement))

p5

p5 + 
  scale_color_brewer("Département", palette = "Spectral")

p5 + 
  scale_color_manual(values = c(1 : 4))

#Variable quantitative
p6 <- ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr, 
                 color = femmes))

p6 + 
  scale_color_gradient("Part des femmes", 
                       low = "white",
                       high = "red")

# avec viridis,
p6 + 
  scale_color_viridis_c(option = "magma")







