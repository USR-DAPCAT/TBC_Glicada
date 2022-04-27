#
rm(list=ls())
gc()


# metode="dinamica2"
# rmarkdown::render("./codi/1_lectura_TBC.Rmd",params = list(metode=metode,cas_com_controls=TRUE))
# rmarkdown::render("./codi/2_preparacio_TBC.Rmd",params = list(metode=metode))
# 


###########   Generar informe 
rmarkdown::render("./codi/3_analisis_TBC_Glicada.Rmd", 
                  output_file = paste0("Informe_Cohort_DM_",Sys.Date()),
                  output_dir = "resultats",
                  params=list(metode="dinamica2",test=FALSE),
                  envir = parent.frame() # Truc per que render dins funció no peti 
                  )



