install.packages("dplyr") # instaler le package dplyr
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
data("starwars") #dans dplyr il y a un jeu de donné starwars
starwars
head(starwars)
colSums(is.na(starwars)) #pour voir ou il a des NA

install.packages("ggplot2")
library(ggplot2)

###enlever les NA des données et autres testes###

data <- starwars |> filter(!is.na(height) & !is.na(mass) & !is.na(hair_color)& !is.na(birth_year) & !is.na(sex)& !is.na(gender)& !is.na(homeworld)& !is.na(species))
head(data)


###premier graph###
ggplot(data)+
  geom_point(aes(x = height, y = homeworld, color= species))

#je veux un graphique de densité 2d avec les especes en point de couleur
#pour voir la répartition des especes selon height et birth_year


ggplot (data)+
  geom_density_2d(aes(x = height, y = birth_year), color = "yellow", linetype = 8)+ #densité 2d, couleure jaune
  geom_point(aes(x = height, y = birth_year, color = species),size = 3, alpha = 2, shape = 7)+ # points de couleure pour espèces
  theme(
    panel.background = element_rect(fill = "black"), #le fond du graphique en noir
    plot.background = element_rect(fill = "black"), # l'arriere du graphique en noir 
    axis.text = element_text(color = "white"), #texte = les epeces en blanc
    axis.title = element_text(color = "white"), # nom des axes en blans
    plot.title = element_text(hjust = 0.5, face = "bold", size = 12, color = "yellow"))+ #taille et couleur du titre 
  ggtitle("Densité des tailles et années de naissance des espèces colorées")


