#Crear base de datos

library(dplyr)
library(tidyverse)
library(readxl)
# 2015 --------------------------------------------------------------

#Percepción sobre la frecuencia de corrupción
aux1<- read_csv("Variables/Corrupción/Utilizadas/frecuencia_corrupcion_15.csv")

#corrupción en diversas instituciones y sectores
aux2 <- read_csv("Variables/Corrupción/Utilizadas/corrupción en diversas instituciones y sectores.csv",skip = 3)
aux2 <-aux2 %>% filter(!is.na(entidad), !is.na(MuyFrecuente_tot&Muy_frecuente))

aux2 <- aux2 %>%  gather("respuesta", "valor", MuyFrecuente_tot:Nunca) %>% 
  mutate(grupo= gsub(pattern = " ", replacement = "_", x = grupo),
         grupo = gsub(pattern = "í", replacement = "i", x = grupo),
         grupo = gsub(pattern = "ú", replacement = "u", x = grupo),
         grupo = gsub(pattern = "ó", replacement = "o", x = grupo),
         grupo = paste0(grupo, "_", respuesta)) %>% 
  select(-respuesta, entidad, grupo, valor) %>% 
  spread(key = grupo, value = valor)

#Usuarios  que experimentaron algún acto de corrupción
aux3 <- read_csv("Variables/Corrupción/Utilizadas/Usuarios  que experimentaron algún acto de corrupción.csv",skip=3)
aux3 <-aux3 %>%  select(entidad, contacto_tot, contacto)


#Total trámites en los que existió experiencia de corrupción
aux4 <- read_csv("Variables/Corrupción/Utilizadas/otal trámites en los que existió experiencia de corrupción.csv", skip = 1)
aux4 <- aux4

bd15 <- aux1 %>%  left_join(aux2, by = "entidad") %>%  left_join(aux3, by = "entidad") %>% 
  left_join(aux4, by = "entidad") %>%  mutate(year = 2015)


# 2017 --------------------------------------------------------------------
#Percepción sobre la frecuencia de corrupción
aux1<- read_csv("Variables/Corrupción/Utilizadas/frecuencia_corrupcion_17.csv")

#corrupción en diversas instituciones y sectores
aux2 <- read_csv("Variables/Corrupción/Utilizadas/corrupción en diversas instituciones y sectores 17.csv",skip = 2)
aux2 <-aux2 %>% filter(!is.na(entidad), !is.na(MuyFrecuente_tot&Muy_frecuente))

aux2 <- aux2 %>%  gather("respuesta", "valor", MuyFrecuente_tot:Nunca) %>% 
  mutate(grupo= gsub(pattern = " ", replacement = "_", x = grupo),
         grupo = gsub(pattern = "í", replacement = "i", x = grupo),
         grupo = gsub(pattern = "ú", replacement = "u", x = grupo),
         grupo = gsub(pattern = "ó", replacement = "o", x = grupo),
         grupo = paste0(grupo, "_", respuesta)) %>% 
  select(-respuesta, entidad, grupo, valor) %>% 
  spread(key = grupo, value = valor)

#Usuarios  que experimentaron algún acto de corrupción
aux3 <- read_csv("Variables/Corrupción/Utilizadas/Usuarios  que experimentaron algún acto de corrupción 17.csv",skip=3)
aux3 <-aux3 %>%  select(entidad, contacto_tot, contacto)


#Total trámites en los que existió experiencia de corrupción
aux4 <- read_csv("Variables/Corrupción/Utilizadas/otal trámites en los que existió experiencia de corrupción 17.csv", skip =2)


bd17 <- aux1 %>%  left_join(aux2, by = "entidad") %>%  left_join(aux3, by = "entidad") %>% 
  left_join(aux4, by = "entidad") %>%  mutate(year = 2017)


# 2019 --------------------------------------------------------------------

#Percepción sobre la frecuencia de corrupción
aux1<- read_csv("Variables/Corrupción/Utilizadas/frecuencia_corrupcion_19.csv")

#corrupción en diversas instituciones y sectores
aux2 <- read_csv("Variables/Corrupción/Utilizadas/corrupción en diversas instituciones y sectores 19.csv",skip = 3)
aux2 <-aux2 %>% filter(!is.na(entidad), !is.na(MuyFrecuente_tot&Muy_frecuente))

aux2 <- aux2 %>%  gather("respuesta", "valor", MuyFrecuente_tot:Nunca) %>% 
  mutate(grupo= gsub(pattern = " ", replacement = "_", x = grupo),
         grupo = gsub(pattern = "í", replacement = "i", x = grupo),
         grupo = gsub(pattern = "ú", replacement = "u", x = grupo),
         grupo = gsub(pattern = "ó", replacement = "o", x = grupo),
         grupo = paste0(grupo, "_", respuesta)) %>% 
  select(-respuesta, entidad, grupo, valor) %>% 
  spread(key = grupo, value = valor)

#Usuarios  que experimentaron algún acto de corrupción
aux3 <- read_csv("Variables/Corrupción/Utilizadas/Usuarios  que experimentaron algún acto de corrupción 19.csv",skip=3)
aux3 <-aux3 %>%  select(entidad, contacto_tot, contacto)


#Total trámites en los que existió experiencia de corrupción
aux4 <- read_csv("Variables/Corrupción/Utilizadas/otal trámites en los que existió experiencia de corrupción 19.csv", skip =1)


bd19 <- aux1 %>%  inner_join(aux2, by = "entidad") %>%  inner_join(aux3, by = "entidad") %>% 
  inner_join(aux4, by = "entidad") %>%  mutate(year = 2019)


corrupcion <-bind_rows(bd15, bd17, bd19)
