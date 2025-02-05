############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : ....

##########################################################################
########################### Fonction utiles ##############################
##########################################################################

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
install.packages("readxl")
library(readxl)
#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################
getwd()
Sites <- read_excel("Sites.xlsx")
Microorga <- read_excel("Microorganismes.xlsx")
Nematodes <- read_excel("Nematodes.xlsx")
Vers <- read_excel("Lombrics.xlsx")
head(Sites)
##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########
#associer sites et deux communautés
#left_join() right_join()
Sites%>%
  inner_join(.,Microorga,join_by(ID)) %>%
  inner_join(.,Nematodes,join_by(ID)) -> SiteMN
SiteMN
##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########
SiteMN %>%
  filter(SITE == "Feucherolles") %>%
  select(SITE:REPET_BLOC, ARGILE, contains("SABLE"), ends_with("MIN"))-> feMN

##########################################################################
####################### Créer des variables ##################
##########################################################################
feMN %>%
  mutate(Ration_Argile_SF = ARGILE / SABLE_F) ->feMN

##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######
feMN %>%
  group_by(Modalite) %>%
  summarise(nombre_repbloc = n()) 
  
  
  #mutate(Ration_SF_SG_MOD = SABLE_F / SABLE_G) ->FEMN, ca ne sert a rien
  

##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités
feMN %>%
  pivot_longer(cols = SABLE_F : SABLE_G, 
               names_to = "Type_Sable", 
               values_to = "Valeur_Sable") ->feMNPIVOT

##########################################################################
######################## Pivots ##########################################
##########################################################################
#pivot longer si j'ai deux colones qui se ressemble comme sableF et G alors je les met dans une seule
#mais ca me fera une colone 2x plus longue


##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

