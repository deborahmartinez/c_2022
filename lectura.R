bd <- read_csv("~/Downloads/encig2019_csv/conjunto_de_datos_encig2019_01_sec1_3_4_5_8_9_10/conjunto_de_datos/conjunto_de_datos_encig2019_01_sec1_3_4_5_8_9_10.csv")
bdp <- read_csv("~/Downloads/encig2019_csv/conjunto_de_datos_encig2019_01_sec_11/conjunto_de_datos/conjunto_de_datos_encig2019_01_sec_11.csv")


bd <- read_csv("~/Downloads/encig2019_csv/conjunto_de_datos_encig2019_04_sec_7/conjunto_de_datos/conjunto_de_datos_encig2019_04_sec_7.csv")
bd %>%  count(ID_TRA)

bd2 <- read_csv("~/Downloads/encig2017_csv/encig2017_01_sec1_3_4_5_8_9_10/conjunto_de_datos/encig2017_01_sec1_3_4_5_8_9_10.csv")
bdp <- read_csv("~/Desktop/e17.csv")

bdp  %>%  count(ID_PER, ID_VIV, NOM_ENT)
bdp %>%  count(ID_TRA)
bd8 <- read_csv("~/Downloads/encig2017_csv/encig2017_05_sec_8/conjunto_de_datos/encig2017_05_sec_8.csv")


bd7 <- read_csv("~/Downloads/encig2017_csv/encig2017_04_sec_7/conjunto_de_datos/encig2017_04_sec_7.csv")
bd7 %>%  count(ID_TRA)

bd3 <- read_csv("~/Downloads/encig_2015_csv/01_sec1_3_4_5_8_9_10_encig2015/conjunto_de_datos/encig2015_01_sec1_3_4_5_8_9_10.csv")
bd3 <- read_csv("~/Downloads/encig_2015_csv/04_sec_7_encig2015/conjunto_de_datos/encig2015_04_sec_7.csv")
bdp <- read_csv("~/Downloads/encig_2015_csv/03_sec_6_8_encig2015/conjunto_de_datos/encig2015_03_sec_6_8.csv")


bdp %>%  count(PER,ENT, UPM)
