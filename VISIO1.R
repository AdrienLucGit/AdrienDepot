install.packages("dplyr") # instaler le package dplyr
library(dplyr)
data("starwars") #dans dplyr il y a un jeu de donné starwars
starwars
head(starwars)
colSums(is.na(starwars)) #pour voir ou il a des NA

install.packages("ggplot2")
library(ggplot2)

#enlever les NA
data <- starwars |> filter(!is.na(height) & !is.na(mass) & !is.na(hair_color)& !is.na(birth_year) & !is.na(sex)& !is.na(gender)& !is.na(homeworld)& !is.na(species))
head(data)
data2 <- data |> select(height, species, homeworld) #pour avoir que 3 variable
data2
ggplot(data2) + geom_histogram(aes(x= height)) # histo de la taille

###chatgpt###
ggplot(data, aes(x = homeworld, y = height, color = species)) +
  geom_point(size = 4, alpha = 0.7) +  
  theme_minimal() +
  coord_flip() + # Tourne le graphique pour lisibilité
  ggtitle("Taille des personnages selon leur planète d'origine") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14))

###De moi###
ggplot(data2)+
  geom_point(aes(x = height, y = homeworld, color= species))

#je veux un graphique de densité 2d avec les especes en point de couleur
#pour voir la répartition des especes selon height et birth_year

ggplot(data)+
  geom_density_2d(aes(x = height, y = birth_year))
 # geom_point(aes(color = species),size = 3, alpha = 0.7)+
  #theme_minimal() +
  #ggtitle("Densité des tailles et années de naissance avec espèces colorées") +
  #theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14))


