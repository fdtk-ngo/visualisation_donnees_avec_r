
# Types de geom

# Installer les packages
install.packages("tidyverse", "questionr", "ggcorrplot", "ggstats", "scales")

# Charger les packages
library(tidyverse) # manipulation
library(questionr) # pour les données
library(ggcorrplot) # graphiques des corrélations
library(ggstats) # calculer des pourcentages
library(scales) # modifier  les libellés sur les axes 

# ou 

install.packages("pacman")

pacman::p_load(
  tidyverse, questionr, ggcorrplot, ggstats, scales
)

## Données
data(rp2018)

rp <- rp2018 %>% 
  filter(
    departement %in% c("Oise", "Rhône", "Hauts-de-Seine", "Bouches-du-Rhône")
    )


### Histogramme : geom_histogram()

ggplot(rp) + 
  geom_histogram(aes(x = cadres))

# bins : nombre d'intervalle
# binwidth : largeur d'intervalle
ggplot(rp) + 
  geom_histogram(aes(x = cadres), 
                 bins = 15, 
                 fill = "cornflowerblue")


ggplot(rp) + 
  geom_freqpoly(aes(x = cadres), 
                 bins = 15, 
                 color = "cornflowerblue")


# 👉 Q: Tracer un histogramme avec la variable ouvr



### Courbe de density : geom_density()

ggplot(rp) + 
  geom_density(aes(x = cadres)) 

# color : liste des couleurs avec colours()
ggplot(rp) + 
  geom_density(aes(x = cadres), color = "sienna3", linewidth = 1.5, linetype = 4) 



### Boîte à moustaches : geom_boxplot()

ggplot(rp) + 
  geom_boxplot(aes(x = cadres)) 

# comparaison de plusieurs distributions
ggplot(rp) + 
  geom_boxplot(aes(x = region, y = cadres), 
               fill = "wheat", color = "darkred") +
  coord_flip()

# varier les boîtes en fct du nombre d'obs : sqrt(n)
ggplot(rp) + 
  geom_boxplot(aes(x = region, y = cadres), 
               fill = "wheat", color = "darkred", varwidth = T)



### Diagramme à barres : geom_bar() / geom_col()

ggplot(rp) +
  geom_bar(aes(x = region))


ggplot(rp) +
  geom_bar(aes(x = region)) +
  scale_y_continuous(expand = c(0, 0))

# avec ggstats : stat = "prop"
ggplot(rp) +
  geom_bar(aes(x = region, y = after_stat(prop), by = 1), stat = "prop") + 
  scale_y_continuous(labels =  scales::label_percent())

#ordonner les modalités
ggplot(rp) +
  geom_bar(aes(x = forcats::fct_infreq(region)))


# afficher les valeurs
ggplot(data = rp, aes(
  # ordonner les modalités
  x = fct_infreq(region),
  # calculer les proportions
  y = after_stat(prop),
  # calculer par rapport au total
  by = 1
)) +
  geom_bar(
    # calculer les proportions des barres
    stat = "prop", fill = "cornflowerblue"
  ) + 
  geom_text(
    # afficher les labels 
    stat = "prop", 
    vjust = 1.6, 
    color = "white")


# geom_col() : à partir d'un tableau
plt1 <- rp %>% 
  group_by(region) %>% 
  summarise(n = n()) %>% 
  mutate(prop = round(n / sum(n) * 100, 2))


plt1 %>% 
  ggplot() + 
  geom_col(aes(x = region, y = prop))

plt1 %>% 
  ggplot(aes(x = region, y = prop)) + 
  geom_col() +
  geom_text(aes(label = prop), vjust = -0.2)

#ordonner les modalités
plt1 %>% 
  ggplot() + 
  geom_col(aes(x = fct_reorder(region, prop, .desc = T), 
               y = prop)) 

### Nuage de points :  geom_point()

ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr))

# size, color et alpha
ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr), 
             size = 3, color = "darkgreen", alpha = 0.5)


# 👉 Q: Remplacer ouvr par cadres et 
# comparer la forme de des deux graphiques

### Nuage de points avec du texte :  geom_text()

ggplot(rp) + 
  geom_text(aes(x = dipl_sup, y = ouvr, label = commune))

ggplot(rp) + 
  geom_label(aes(x = dipl_sup, y = ouvr, label = commune))



### Courble linéaire : geom_line

data("economics")
head(economics)

ggplot(economics) + 
  geom_line(aes(x = date, y = psavert)) + 
  ggtitle("Evolution du taux d'épargne personnel aux
          \nEtats-Unis de 1967 à 2015") + 
  xlab("Année") + 
  ylab("Taux d'épargne personnel")

# même résultat avec labs()
ggplot(economics) + 
  geom_line(aes(x = date, y = psavert)) + 
  labs(title = "Evolution du taux d'épargne personnel aux
          \nEtats-Unis de 1967 à 2015",
       x = "Année",
       y = "Taux d'épargne personnel")



### Visualiser les corrélations
library(ggcorrplot)

rp %>% 
      # sélection des variables
      select(agric, femmes, indep, dipl_aucun, dipl_bac, dipl_sup, 
             locataire, chom, cadres, ouvr) %>% 
  cor() %>% 
  round(2)

rp %>% 
  # sélection des variables
  select(agric, femmes, indep, dipl_aucun, dipl_bac, dipl_sup, 
         locataire, chom, cadres, ouvr) %>%
  # calcul de la corrélation
  cor() %>%
  # graphique
  ggcorrplot(type = "lower", hc.order = T, lab = T) +   
  ggtitle("Matrice de corrélation ")




