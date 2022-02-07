library(dplyr)
library(tidyverse)
library(Hmisc)
library(ggpubr)
library(purrr)  
library(ggplot2)
library(broom)


# Bases -------------------------------------------------------------------
corrupcion <- read_csv("Variables/Corrupción/Finales/corrupcion.csv")
pib <- read_csv("Variables/Corrupción/Finales/pib.csv")
control <- read_csv("Variables/Corrupción/Finales/control.csv")

bd <- corrupcion %>%  left_join(pib, by = c("entidad", "year")) %>% 
  mutate(corrupcion = Muy_frecuente+Frecuente,
         camara = Diputados_y_Senadores_Muy_frecuente+Diputados_y_Senadores_Frecuente,
         ejercito =Ejército_y_Marina_Muy_frecuente+Ejército_y_Marina_Frecuente,
         federal = Gobierno_Federal_Muy_frecuente+Gobierno_Federal_Frecuente,
         estatal = Gobiernos_Estatales_Muy_frecuente+Gobiernos_Estatales_Frecuente,
         municipal = Gobiernos_Municipales_Muy_frecuente+ Gobiernos_Municipales_Frecuente,
         ministerio = Ministerio_Publico_Muy_frecuente+Ministerio_Publico_Frecuente,
         policia = Policias_Muy_frecuente+Policias_Frecuente, 
         contacto = contacto/pob_usuario, tramites =  tramites/pob_usuario) %>%  
  select(entidad,year, corrupcion, camara,federal, estatal, municipal,
         ejercito, ministerio, policia, contacto, tramites, 
         starts_with(match = "pib_"))

bd_completa <- bd %>%  inner_join(control, by = c("entidad", "year")) 
# bd_completa %>%  write_excel_csv("Variables/Corrupción/Finales/completa_respaldo.csv")
# r2 ----------------------------------------------------------------------

bd %>% select(- starts_with(c("pib_")), -entidad) %>% 
  map(~lm(bd$pib_total~ .x, data = bd)) %>% 
  map(summary) %>% 
  map_dbl("r.squared") %>% 
  tidy %>% 
  dplyr::arrange(desc(x)) %>% 
  rename(r.squared = x) 

bd %>% select(- starts_with(c("pib_")), -entidad, -year) %>% 
  map(~lm(bd$pib_terciarias~ .x, data = bd)) %>% 
  map(summary) %>% 
  map_dbl("r.squared") %>% 
  tidy %>% 
  dplyr::arrange(desc(x)) %>% 
  rename(r.squared = x) 

bd %>% select(- starts_with(c("pib_")), -entidad, -year) %>% 
  map(~lm(bd$pib_secundarias~ .x, data = bd)) %>% 
  map(summary) %>% 
  map_dbl("r.squared") %>% 
  tidy %>% 
  dplyr::arrange(desc(x)) %>% 
  rename(r.squared = x) 

bd %>% select(- starts_with(c("pib_")), -entidad, -year) %>% 
  map(~lm(bd$pib_primarias~ .x, data = bd)) %>% 
  map(summary) %>% 
  map_dbl("r.squared") %>% 
  tidy %>% 
  dplyr::arrange(desc(x)) %>% 
  rename(r.squared = x) 

bd %>% select(- starts_with(c("pib_")), -entidad, -year) %>% 
  map(~lm(bd$pib_educacion~ .x, data = bd)) %>% 
  map(summary) %>% 
  map_dbl("r.squared") %>% 
  tidy %>% 
  dplyr::arrange(desc(x)) %>% 
  rename(r.squared = x)

bd %>% select(- starts_with(c("pib_")), -entidad, -year) %>% 
  map(~lm(bd$pib_salud~ .x, data = bd)) %>% 
  map(summary) %>% 
  map_dbl("r.squared") %>% 
  tidy %>% 
  dplyr::arrange(desc(x)) %>% 
  rename(r.squared = x)

bd %>%  select(pib_secundarias, contacto) %>%  na.omit() %>% 
  cor

