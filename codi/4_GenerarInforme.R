######################
# GENERAR INFORME  ##
#####################
#
#11.04.2022#
#
# TAULA1
#i)     MACRO:= CI,AVC,ARTPER,COM_OFT
#ii)    antecedents Tb prèvia o?(DM)
#iii)   Vacunes , dt_vacunes
#
#

# TAULA2
#i)     TOTAL[<7.5,>=7.5,Missings!]
#ii)    Cavern? 0? 
#iii)   Resistències

# TAULA3
#i)     Ajustar: HR:: Edat,Sexe.

# TAULA4: anàlisi multivariant 
#         i)            EdAT
#         ii)           Sexe
#         iii)          Temps Dm
#         iv)           Complicacio Macro 
#         v)            Complicacio Micro [Retina+Nefro]
#         vi)           Tabac
#         vii)          Medaea
#         viii)         Alcohol
#         ix)           IMC
##########################

#DUBTES:
#Table 1. Baseline characteristics of the study variables between diabetics with and without TB
#


#DUBTE 10:

#Glycosylated haemoglobin
#- <7.5%
#- >= 7.5

#He tallat la HbA1c a 7,5% perque em semblava que a la nostra mostra es
#el que millor separa els que faran i els que no faran TB (però tampoc es una meravella 7,66 vs 7,41)
#Potser si fem corbes de  supervivencia de KM o corbes ROC per veure valor predictiu)
#Faig poques categories per augmentar la potencia estadística


#DUBTE 12:

#DM complications
#-	Macrovascular disease
#-	Diabetic retinopathy 
#-	Diabetic nephropathy
#-	Diabetic neuropathy

#FALTEN AQUESTES 2 COMPLICACIONS
#Tampoc he trobat aquestes dades al SPSS ni al analisi preliminar que haviau fet


#DUBTE 14:

#Flu vaccination   no sé si està aquesta dada
#crec que no tenim aquesta dada


#DUBTE 16:
#Taula 2.:


#DUBTE 17:
#Radiography
#•	Normal
#•	Cavern
#•	Anormal no cavern

#CAP CAVERNA?
#  comprobar que crec que està be … em sembla que està equivocat

#DUBTE 19:
#Pauta de tratamiento
#Aqui haurem de posar les pautes que trobem al analisi descriptiu, potser agruparles en pautes sencilles i pautes no habituals …. O similar.
#Caldria fer una exploració inicial de les pautes de Tt que tenim enregistrades i despres pensem en agrupar-les
#Crec que al final les agruparem amb:
#- No tt farmacologic
#- Tto ADNI’s (no insulina)
#- Tt amb Insulina
#Aquí sí que haurien de sumar 100% si fem aquestes 3 categories
#
#

#DUBTE 20:
#Resistencies
#Treballar mes les característiques segons les variables que figurin a la BD de la Agencia
#Cal mirar com esta la variable a la BD
#Fer un llistat de variables que puguem btenir






#
#17.2.2022#
#############
#[27.9.2021]#
#[12.4.2021]#
#[31.3.2021]#
############
#18:00

# el que he caanviat del TBC del jordi.Real

#################################################################################
#1_lectura_TBC.Rmd
#library("heaven",lib.loc="C:/Users/Ramon/Desktop/llibreria_R/heaven_2018")
#
#C:\Users\38122893W\Desktop\llibreria_R\heaven_2018


# fer-ho: 
#install.packages("remotes")
#remotes::install_github("tagteam/heaven")



#library("heaven",lib.loc="C:/Users/38122893W/Desktop/llibreria_R/heaven_2018")

library("heaven")



#################################################################################
#3_analisis_TBC.Rmd
#recode_to_missings funcion   9.3.2021  
# if else   changued to   ifelse    9.3.2021  #
#
#dadesmodel<-modelcomplet$resum_crrsc %>% 
#  mutate(id=n():1,Categoria=stringr::str_sub(var,1,30)) %>% 
#  dplyr::select(id,Categoria,HR,`Li95%CI`,`Ls95%CI`,'p-value')%>%
#  filter(Categoria!="Origin.None")%>%
#  filter(Categoria!="SBP.None")%>%
#  filter(Categoria!="DBP.None")%>%
#  filter(Categoria!="BMI.None")
#################################################################################


############
##poblacio##
############

rm(list=ls())
#gc()

library("heaven")


metode="dinamica2"
rmarkdown::render("./codi/1_lectura_TBC.Rmd",params = list(metode=metode,cas_com_controls=TRUE))
rmarkdown::render("./codi/2_preparacio_TBC.Rmd",params = list(metode=metode))



###########   Generar informe 
subtitul="Cohorte DINÁMICA: Controles sin reemplazo"
rmarkdown::render("./codi/3_analisis_TBC2B.Rmd", 
                  output_file = paste0("Informe_Cohort_Din_POBLACIO_",Sys.Date()),
                  output_dir = "resultats",
                  params=list(metode=metode,subtitul=subtitul, test=FALSE),
                  envir = parent.frame() # Truc per que render dins funció no peti 
)

###########   Generar informe 
subtitul="Cohorte DINÁMICA: Controles sin reemplazo"
rmarkdown::render("./codi/3_analisis_TBC2C.Rmd", 
                  output_file = paste0("Informe_Cohort_Din_Dependent_Temps_POBLACIO_",Sys.Date()),
                  output_dir = "resultats",
                  params=list(metode=metode,subtitul=subtitul, test=FALSE),
                  envir = parent.frame() # Truc per que render dins funció no peti 
)




#03.03.2022



##########
##mostra##
##########


rm(list=ls())
#gc()

library("heaven")

metode="dinamica2"
rmarkdown::render("./codi/1_lectura_TBC.Rmd",params = list(metode=metode,cas_com_controls=TRUE))
rmarkdown::render("./codi/2_preparacio_TBC.Rmd",params = list(metode=metode))

#

#gc()
###########   Generar informe 
metode="dinamica2"
subtitul="Cohorte DINÁMICA: Controles sin reemplazo una MUESTRA!"
rmarkdown::render("./codi/3_analisis_TBC2B.Rmd", 
                  output_file = paste0("Informe_Cohort_Din_MOSTRA_",Sys.Date()),
                  output_dir = "resultats",
                  params=list(metode=metode,subtitul=subtitul, test=TRUE),
                  envir = parent.frame() # Truc per que render dins funció no peti 
)


#gc()
###########   Generar informe 
metode="dinamica2"
subtitul="Cohorte DINÁMICA: Controles sin reemplazo una MUESTRA!"
rmarkdown::render("./codi/3_analisis_TBC2C.Rmd", 
                  output_file = paste0("Informe_Cohort_Din_Dependent_Temps_MOSTRA_",Sys.Date()),
                  output_dir = "resultats",
                  params=list(metode=metode,subtitul=subtitul, test=TRUE),
                  envir = parent.frame() # Truc per que render dins funció no peti 
)


