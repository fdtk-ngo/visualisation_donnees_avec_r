
# Mappages

pacman::p_load(
  tidyverse, questionr, ggstats
)

# charger les données
load("data/rp.Rdata")



ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr))

# varier les couleurs et le motif selon les départements
ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr, color = departement))

ggplot(rp) + 
  geom_point(aes(x = dipl_sup, y = ouvr, shape = departement, color = departement))


# ajout d'une variable numérique : taux de chômage
ggplot(rp) + 
  geom_point(aes(
    x = dipl_sup, 
    y = ouvr, 
    color = departement, 
    size = chom), alpha = 0.5) 



ggplot(rp) + 
  geom_density(aes(x = cadres)) 


ggplot(rp) + 
  geom_density(aes(x = cadres, color = region)) 

rp %>% 
  group_by(region) %>% 
  summarise(prop = mean(cadres))

# ajouter linetype = region 
ggplot(rp) + 
  geom_density(aes(x = cadres, linetype = region))



# A l’intérieur de aes()ou non ?

ggplot(rp) +
  geom_point(aes(x = dipl_sup, y = cadres), size = 3)


ggplot(rp) +
  geom_point(aes(x = dipl_sup, y = cadres, size = pop_tot))


# varier la couleur
ggplot(data = rp) + 
  geom_bar(aes(
    x = departement, 
    fill = departement), show.legend = F) 


# Mappage avec geom_bar

ggplot(rp) +
  geom_bar(aes(x = region, fill = pop_cl))


# ajouter des effectifs
ggplot(rp, aes(x = region, 
               fill = pop_cl,
               label = after_stat(count))) +
  geom_bar() + 
  geom_text(
    stat = "count",
    position = position_stack(0.5)#,
    #color = "white"
  )



# barres côte à côte
ggplot(rp) +
  geom_bar(aes(x = region, fill = pop_cl), position = "dodge")

# avec ggstats
# barres côte à côte : pourcentages
ggplot(rp, aes(x = region,
               y = after_stat(prop),
               by = pop_cl,
               fill = pop_cl,
               label = scales::percent(after_stat(prop), accuracy = 12))) +
  geom_bar(stat = "prop",
           position = position_dodge(0.9)) + 
  geom_text(aes(y = after_stat(prop) - 0.01), # texte en dehors des barres : +0.01
            stat = "prop",
            position = position_dodge(0.9)) + 
  scale_y_continuous(labels = scales::percent) 




# barres avec des proportions

ggplot(rp) +
  geom_bar(aes(x = region, fill = pop_cl), position = "fill") 



# ajouter des pourcentages
ggplot(rp, aes(x = region, 
               fill = pop_cl, 
               by = pop_cl,
               label = scales::percent(after_stat(prop), accuracy = 0.1))) +
  geom_bar(position = "fill") + 
  geom_text(
    stat = "prop",
    position = position_fill(0.5),
    color = "white"
  ) + 
  theme(axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank()) + 
  scale_y_continuous(expand = c(0, 0))




# utiliser plusieurs sources de données

com80 <- filter(rp, pop_tot > 80000)

ggplot(data = rp, aes(x = dipl_sup, y = cadres)) +
  geom_point(alpha = 0.2) +
  geom_text(
    data = com80, aes(label = commune),
    color = "red", size = 3
  )


