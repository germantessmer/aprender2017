# Libraries ####

library(readr)
library(tidyverse)
library(stringr)

# Load ####

datos <- read.delim2("C:/Users/German/Desktop/data/aprender2017-secundaria-12.csv", encoding="UTF-8")

# datos2 <- datos2 %>%
#  select(ponder, lpondera, mpondera, TEL, TEM) 
  
#datos <- read_delim("C:/Users/German/Desktop/data/aprender2017-secundaria-12.csv", delim = "\t", escape_double = FALSE, trim_ws = TRUE)



# Creación ids ####

datos <- datos %>%
         mutate(ap3a = ifelse(is.na(ap3a), -9, ap3a),
                id_pais = ap3a,
                id_jurisdiccion = cod_provincia,
                id_alumno = row_number())



## id_hogar ------
datos <- datos %>%
         mutate(id_jurisdiccion = case_when(
                                  id_jurisdiccion == 2 ~ "a02",
                                  id_jurisdiccion == 6 ~ "a06",
                                  id_jurisdiccion == 10 ~ "a10",
                                  id_jurisdiccion == 14 ~ "a14",
                                  id_jurisdiccion == 18 ~ "a18",
                                  id_jurisdiccion == 22 ~ "a22",
                                  id_jurisdiccion == 26 ~ "a26",
                                  id_jurisdiccion == 30 ~ "a30",
                                  id_jurisdiccion == 34 ~ "a34",
                                  id_jurisdiccion == 38 ~ "a38",
                                  id_jurisdiccion == 42 ~ "a42",
                                  id_jurisdiccion == 46 ~ "a46",
                                  id_jurisdiccion == 50 ~ "a50",
                                  id_jurisdiccion == 54 ~ "a54",
                                  id_jurisdiccion == 58 ~ "a58",
                                  id_jurisdiccion == 62 ~ "a62",
                                  id_jurisdiccion == 66 ~ "a66",
                                  id_jurisdiccion == 70 ~ "a70",
                                  id_jurisdiccion == 74 ~ "a74",
                                  id_jurisdiccion == 78 ~ "a78",
                                  id_jurisdiccion == 82 ~ "a82",
                                  id_jurisdiccion == 86 ~ "a86",
                                  id_jurisdiccion == 90 ~ "a90",
                                  id_jurisdiccion == 94 ~ "a94"),
                aux1 = id_jurisdiccion,
                aux2 = case_when(ap4 == 1 ~ "v01",
                                 ap4 == 2 ~ "v02",
                                 ap4 == 3 ~ "v03",
                                 ap4 == 4 ~ "v04",
                                 ap4 == 5 ~ "v05",
                                 ap4 == 6 ~ "v06",
                                 ap4 == 7 ~ "v07",
                                 ap4 == 8 ~ "v08",
                                 ap4 == 9 ~ "v09",
                                 ap4 == 10 ~ "v10",
                                 ap4 == 11 ~ "v11",
                                 ap4 == 12 ~ "v12",
                                 ap4 == -1 ~ "v13",
                                 ap4 == -6 ~ "v14",
                                 ap4 == -9 ~ "v15"),
                aux3 = case_when(ap5a == 1 ~ 1,
                                 ap5a == 2 ~ 2,
                                 ap5a == -1 ~ 3,
                                 ap5a == -6 ~ 4,
                                 ap5a == -9 ~ 5,
                                 is.na(ap5a) ~ 5),
                aux4 = case_when(ap5b == 1 ~ 1,
                                 ap5b == 2 ~ 2,
                                 ap5b == -1 ~ 3,
                                 ap5b == -6 ~ 4,
                                 ap5b == -9 ~ 5,
                                 is.na(ap5b) ~ 5),
                aux5 = case_when(ap5c == 1 ~ 1,
                                 ap5c == 2 ~ 2,
                                 ap5c == -1 ~ 3,
                                 ap5c == -6 ~ 4,
                                 ap5c == -9 ~ 5,
                                 is.na(ap5c) ~ 5),
                aux6 = case_when(ap5d == 1 ~ 1,
                                 ap5d == 2 ~ 2,
                                 ap5d == -1 ~ 3,
                                 ap5d == -6 ~ 4,
                                 ap5d == -9 ~ 5,
                                 is.na(ap5d) ~ 5),
                aux7 = case_when(ap5e == 1 ~ 1,
                                 ap5e == 2 ~ 2,
                                 ap5e == -1 ~ 3,
                                 ap5e == -6 ~ 4,
                                 ap5e == -9 ~ 5,
                                 is.na(ap5e) ~ 5),
                aux8 = case_when(ap5f == 1 ~ 1,
                                 ap5f == 2 ~ 2,
                                 ap5f == -1 ~ 3,
                                 ap5f == -6 ~ 4,
                                 ap5f == -9 ~ 5,
                                 is.na(ap5f) ~ 5),
                aux9 = case_when(ap5g == 1 ~ 1,
                                 ap5g == 2 ~ 2,
                                 ap5g == -1 ~ 3,
                                 ap5g == -6 ~ 4,
                                 ap5g == -9 ~ 5,
                                 is.na(ap5g) ~ 5),
                aux10 = case_when(ap5h == 1 ~ 1,
                                  ap5h == 2 ~ 2,
                                  ap5h == -1 ~ 3,
                                  ap5h == -6 ~ 4,
                                  ap5h == -9 ~ 5,
                                  is.na(ap5h) ~ 5),
                aux11 = case_when(ap6 == 1 ~ "h01",
                                  ap6 == 2 ~ "h02",
                                  ap6 == 3 ~ "h03",
                                  ap6 == 4 ~ "h04",
                                  ap6 == 5 ~ "h05",
                                  ap6 == 6 ~ "h06",
                                  ap6 == 7 ~ "h07",
                                  ap6 == 8 ~ "h08",
                                  ap6 == 9 ~ "h09",
                                  ap6 == 10 ~ "h10",
                                  ap6 == -1 ~ "h11",
                                  ap6 == -6 ~ "h12",
                                  ap6 == -9 ~ "h13"),
                aux12 = case_when(ap7a == 1 ~ 1,
                                  ap7a == 2 ~ 2,
                                  ap7a == -1 ~ 3,
                                  ap7a == -6 ~ 4,
                                  ap7a == -9 ~ 5,
                                  is.na(ap7a) ~ 5),
                aux13 = case_when(ap7b == 1 ~ 1,
                                  ap7b == 2 ~ 2,
                                  ap7b == -1 ~ 3,
                                  ap7b == -6 ~ 4,
                                  ap7b == -9 ~ 5,
                                  is.na(ap7b) ~ 5),
                aux14 = case_when(ap7c == 1 ~ 1,
                                  ap7c == 2 ~ 2,
                                  ap7c == -1 ~ 3,
                                  ap7c == -6 ~ 4,
                                  ap7c == -9 ~ 5,
                                  is.na(ap7c) ~ 5),
                aux15 = case_when(ap7d == 1 ~ 1,
                                  ap7d == 2 ~ 2,
                                  ap7d == -1 ~ 3,
                                  ap7d == -6 ~ 4,
                                  ap7d == -9 ~ 5,
                                  is.na(ap7d) ~ 5),
                aux16 = case_when(ap8a == 1 ~ 1,
                                  ap8a == 2 ~ 2,
                                  ap8a == -1 ~ 3,
                                  ap8a == -6 ~ 4,
                                  ap8a == -9 ~ 5,
                                  is.na(ap8a) ~ 5),
                aux17 = case_when(ap8b == 1 ~ 1,
                                  ap8b == 2 ~ 2,
                                  ap8b == -1 ~ 3,
                                  ap8b == -6 ~ 4,
                                  ap8b == -9 ~ 5,
                                  is.na(ap8b) ~ 5),
                aux18 = case_when(ap8c == 1 ~ 1,
                                  ap8c == 2 ~ 2,
                                  ap8c == -1 ~ 3,
                                  ap8c == -6 ~ 4,
                                  ap8c == -9 ~ 5,
                                  is.na(ap8c) ~ 5),
                aux19 = case_when(ap8d == 1 ~ 1,
                                  ap8d == 2 ~ 2,
                                  ap8d == -1 ~ 3,
                                  ap8d == -6 ~ 4,
                                  ap8d == -9 ~ 5,
                                  is.na(ap8d) ~ 5),
                aux20 = case_when(ap8e == 1 ~ 1,
                                  ap8e == 2 ~ 2,
                                  ap8e == -1 ~ 3,
                                  ap8e == -6 ~ 4,
                                  ap8e == -9 ~ 5,
                                  is.na(ap8e) ~ 5),
                aux21 = case_when(ap8f == 1 ~ 1,
                                  ap8f == 2 ~ 2,
                                  ap8f == -1 ~ 3,
                                  ap8f == -6 ~ 4,
                                  ap8f == -9 ~ 5,
                                  is.na(ap8f) ~ 5),
                aux22 = case_when(ap8g == 1 ~ 1,
                                  ap8g == 2 ~ 2,
                                  ap8g == -1 ~ 3,
                                  ap8g == -6 ~ 4,
                                  ap8g == -9 ~ 5,
                                  is.na(ap8g) ~ 5),
                aux23 = case_when(ap10 == 1 ~ "m01",
                                  ap10 == 2 ~ "m02",
                                  ap10 == 3 ~ "m03",
                                  ap10 == 4 ~ "m04",
                                  ap10 == 5 ~ "m05",
                                  ap10 == 6 ~ "m06",
                                  ap10 == 7 ~ "m07",
                                  ap10 == 8 ~ "m08",
                                  ap10 == -1 ~ "m09",
                                  ap10 == -6 ~ "m10",
                                  ap10 == -9 ~ "m11"),
                aux24 = case_when(ap11 == 1 ~ "p01",
                                  ap11 == 2 ~ "p02",
                                  ap11 == 3 ~ "p03",
                                  ap11 == 4 ~ "p04",
                                  ap11 == 5 ~ "p05",
                                  ap11 == 6 ~ "p06",
                                  ap11 == 7 ~ "p07",
                                  ap11 == 8 ~ "p08",
                                  ap11 == -1 ~ "p09",
                                  ap11 == -6 ~ "p10",
                                  ap11 == -9 ~ "p11"),
                aux25 = case_when(isocioa == 1 ~ 1,
                                  isocioa == 2 ~ 2,
                                  isocioa == 3 ~ 3,
                                  isocioa == -1 ~ 4,
                                  is.na(isocioa) ~ 4),
                aux11 = ifelse(is.na(aux11), "h13", aux11),
                aux2 = ifelse(is.na(aux2), "v15", aux2),
                aux23 = ifelse(is.na(aux23), "m11", aux23),
                aux24 = ifelse(is.na(aux24), "p11", aux24)) %>%

         unite("id_hogar", c("aux1",	"aux2",	"aux3",	"aux4",	"aux5",	"aux6",	"aux7",	"aux8",	"aux9",	
                             "aux10",	"aux11",	"aux12",	"aux13",	"aux14",	"aux15",	"aux16",	
                             "aux17",	"aux18",	"aux19",	"aux20",	"aux21",	"aux22",	"aux23",	
                             "aux24",	"aux25"), sep ="", remove = TRUE)


## id_escuela ----
datos <- datos %>%
  mutate(ICSE = ifelse(is.na(ICSE), 4, ICSE),
         aux1 = id_jurisdiccion,
         aux2 = sector,
         aux3 = ambito,
         aux4 = ICSE,
         aux5 = case_when(iclima == 1 ~ 1,
                          iclima == 2 ~ 2,
                          iclima == 3 ~ 3,
                          iclima == -1 ~ 4),
         aux6 = case_when(iclimal == 1 ~ 1,
                          iclimal == 2 ~ 2,
                          iclimal == 3 ~ 3,
                          iclimal == -1 ~ 4),
         aux7 = case_when(iclimam == 1 ~ 1,
                          iclimam == 2 ~ 2,
                          iclimam == 3 ~ 3,
                          iclimam == -1 ~ 4)) %>%
  
  unite("id_escuela", c("aux1",	"aux2",	"aux3",	"aux4",	"aux5",	"aux6",	"aux7"), sep="", remove = TRUE)




# Etiquetado ####
 
## 1. ------------------------------------------------------------------------------------------
x <- c("ap3a", "ap3b", "ap3c")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "-1", "-6", "-9"),
                     labels = c("Argentina",
                                "Bolivia",
                                "Brasil",
                                "Chile",
                                "Paraguay",
                                "Perú",
                                "Uruguay",
                                "Otros",
                                "No sé",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 


## 2. ------------------------------------------------------------------------------------------------
x <- c("ap5a", "ap5b",	"ap5c",	"ap5d",	"ap5e",	"ap5f",	"ap5g",	"ap5h",	"ap7a",	"ap7b",	"ap7c",	
       "ap7d",	"ap8a",	"ap8b",	"ap8c",	"ap8d",	"ap8e",	"ap8f",	"ap8g",	"ap13",	"ap16",	"ap17",	
       "ap18",	"ap22",	"ap25",	"ap26a",	"ap26b",	"ap26c",	"ap26d",	"ap26e",	"ap26f",	"ap26g",	
       "ap26h",	"ap28",	"ap33a",	"ap33b",	"ap33c",	"ap33d",	"ap33e",	"ap33f",	"ap33g",	"ap34a",	
       "ap36",	"ap37a",	"ap37b",	"ap37c",	"ap37d",	"ap37e",	"ap37f",	"ap37g",	"ap37h",	"ap38",	
       "ap39",	"ap40",	"ap42",	"ap44a",	"ap44b",	"ap44c",	"ap44d",	"ap44e",	"ap44f",	"ap45a",	"ap45b",	
       "ap45c",	"ap45d",	"ap45e",	"ap45f",	"ap45g",	"ap45h",	"ap45i",	"ap46a",	"ap46b")




datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "-1", "-6", "-9"),
                     labels = c("Sí",
                                "No",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 


## 3. --------------------------------------------------------------------------------------------------
x <- c("ap10", "ap11")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "4", "5", "6", "7", "8", "-1", "-6", "-9"),
                     labels = c("No fue a la escuela",
                                "Primaria incompleta",
                                "Primaria completa",
                                "Secundaria incompleta",
                                "Secundaria completa",
                                "Universitario o terciario incompleto",
                                "Universitario o terciario completo",
                                "No sé",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 


## 4. ------------------------------------------------------------------------------------------
x <- c("ap12", "ap14")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "-1", "-6", "-9"),
                     labels = c("Sí",
                                "No",
                                "No sé",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 

## 5. ------------------------------------------------------------------------------------------
x <- c("ap15a",	"ap15b",	"ap15c",	"ap31a",	"ap31b",	"ap31c",	"ap32a",	"ap32b",	"ap32c",	
       "ap35a",	"ap35b",	"ap35c",	"ap35d",	"ap35e",	"ap35f",	"ap35g",	"ap35h",	"ap35i",	
       "ap35j")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "4", "-1", "-6", "-9"),
                     labels = c("Siempre",
                                "Muchas veces",
                                "Pocas veces",
                                "Nunca",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 

## 6. ------------------------------------------------------------------------------------------
x <- c("ap20", "ap21")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "4", "-1", "-6", "-9"),
                     labels = c("No",
                                "Sí, una vez",
                                "Sí, dos veces",
                                "Sí, tres veces o más",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 


## 7. ------------------------------------------------------------------------------------------
x <- c("ap30a",	"ap30b",	"ap30c",	"ap30d",	"ap30e",	"ap30f",	
       "ap30g",	"ap30h",	"ap48a",	"ap48b",	"ap48c")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "4", "-1", "-6", "-9"),
                     labels = c("Muy sencillo",
                                "Sencillo",
                                "Difícil",
                                "Muy difícil",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 

## 8. ------------------------------------------------------------------------------------------
x <- c("ap41", "ap43")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "-1", "-6", "-9"),
                     labels = c("Sí",
                                "No",
                                "No sé",
                                "No corresponde",
                                "Multimarca",
                                "Blanco")) 

## 9. ------------------------------------------------------------------------------------------
x <- c("ldesemp", "mdesemp")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "4"),
                     labels = c("Por debajo del nivel básico",
                                "Básico",
                                "Satisfactorio",
                                "Avanzado")) 

## 10. ------------------------------------------------------------------------------------------
x <- c("isocioa",	"isocioal",	"isocioam",	"iclima",	"iclimal",	"iclimam")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "-1"),
                     labels = c("Bajo",
                                "Medio",
                                "Alto",
                                "No corresponde")) 

## 11. ------------------------------------------------------------------------------------------
x <- c("autoconlengua", 
       "autoconmatematica",
       "autoconlengual",
       "autoconmatematicam")

datos[ ,x] <- lapply(datos[ ,x], factor, 
                     levels = c("1", "2", "3", "-1"),
                     labels = c("Alto",
                                "Medio",
                                "Bajo",
                                "No corresponde")) 
## 12. Sueltas ----------------------


datos <- datos %>%
  mutate(ap1 = case_when(ap1 == 1 ~ "16 años o menos",
                         ap1 == 2 ~ "17 años",
                         ap1 == 3 ~ "18 años",
                         ap1 == 4 ~ "19 años",
                         ap1 == 5 ~ "20 años o más",
                         ap1 == -1 ~ "No corresponde",
                         ap1 == -6 ~ "Multimarca",
                         ap1 == -9 ~ "Blanco"),
         ap2 = case_when(ap2 == 1 ~ "Varón",
                         ap2 == 2 ~ "Mujer",
                         ap2 == -1 ~ "No corresponde",
                         ap2 == -6 ~ "Multimarca",
                         ap2 == -9 ~ "Blanco"),
         ap4 = case_when(ap4 == 1 ~ "Vivo solo",
                         ap4 == 2 ~ "Una",
                         ap4 == 3 ~ "Dos",
                         ap4 == 4 ~ "Tres",
                         ap4 == 5 ~ "Cuatro",
                         ap4 == 6 ~ "Cinco",
                         ap4 == 7 ~ "Seis",
                         ap4 == 8 ~ "Siete",
                         ap4 == 9 ~ "Ocho",
                         ap4 == 10 ~ "Nueve",
                         ap4 == 11 ~ "Diez o más",
                         ap4 == 12 ~ "No sé",
                         ap4 == -1 ~ "No corresponde",
                         ap4 == -6 ~ "Multimarca",
                         ap4 == -9 ~ "Blanco"),
         ap6 = case_when(ap6 == 1 ~ "Una",
                         ap6 == 2 ~ "Dos",
                         ap6 == 3 ~ "Tres",
                         ap6 == 4 ~ "Cuatro",
                         ap6 == 5 ~ "Cinco",
                         ap6 == 6 ~ "Seis",
                         ap6 == 7 ~ "Siete",
                         ap6 == 8 ~ "Ocho",
                         ap6 == 9 ~ "Nueve o más",
                         ap6 == 10 ~ "No sé",
                         ap6 == -1 ~ "No corresponde",
                         ap6 == -6 ~ "Multimarca",
                         ap6 == -9 ~ "Blanco"),
         ap9 = case_when(ap9 == 1 ~ "No hay libros",
                         ap9 == 2 ~ "De 1 a 25 libros",
                         ap9 == 3 ~ "De 26 a 50 libros",
                         ap9 == 4 ~ "De 51 a 100 libros",
                         ap9 == 5 ~ "Más de 100 libros",
                         ap9 == 6 ~ "No sé",
                         ap9 == -1 ~ "No corresponde",
                         ap9 == -6 ~ "Multimarca",
                         ap9 == -9 ~ "Blanco"),
         ap19 = case_when(ap19 == 1 ~ "Sí, fui al jardín antes de los cuatro años",
                          ap19 == 2 ~ "Sí, fui al jardín desde salita de 4",
                          ap19 == 3 ~ "Sí, fui al jardín desde salita de 5",
                          ap19 == 4 ~ "No fui al jardín",
                          ap19 == 5 ~ "No sé",
                          ap19 == -1 ~ "No corresponde",
                          ap19 == -6 ~ "Multimarca",
                          ap19 == -9 ~ "Blanco"),
         ap23 = case_when(ap23 == 1 ~ "Nunca",
                          ap23 == 2 ~ "Menos de 15 veces",
                          ap23 == 3 ~ "Entre 15 y 24 veces",
                          ap23 == 4 ~ "Más de 24 veces",
                          ap23 == -1 ~ "No corresponde",
                          ap23 == -6 ~ "Multimarca",
                          ap23 == -9 ~ "Blanco"),
         ap24 = case_when(ap24 == 1 ~ "Por el clima",
                          ap24 == 2 ~ "Porque es difícil llegar a la escuela",
                          ap24 == 3 ~ "Por enfermedad",
                          ap24 == 4 ~ "Porque ayudé a mis padres/familiares en su trabajo",
                          ap24 == 5 ~ "Porque trabajé fuera de mi casa para alguien que no es parte de mi familia",
                          ap24 == 6 ~ "Por ayudar con las tareas en mi casa",
                          ap24 == 7 ~ "Otros",
                          ap24 == -1 ~ "No corresponde",
                          ap24 == -6 ~ "Multimarca",
                          ap24 == -9 ~ "Blanco"),
         ap27 = case_when(ap27 == 1 ~ "Menos de media hora",
                          ap27 == 2 ~ "Entre media hora y 1 hora",
                          ap27 == 3 ~ "Entre 1 hora y 2 horas",
                          ap27 == 4 ~ "Más de 2 horas",
                          ap27 == -1 ~ "No corresponde",
                          ap27 == -6 ~ "Multimarca",
                          ap27 == -9 ~ "Blanco"),
         ap29 = case_when(ap29 == 1 ~ "Sí, con todos",
                          ap29 == 2 ~ "Sí, con la mayoria",
                          ap29 == 3 ~ "Sí, con algunos",
                          ap29 == 4 ~ "Sí, con pocos",
                          ap29 == 5 ~ "No me llevo bien con ningún compañero",
                          ap29 == -1 ~ "No corresponde",
                          ap29 == -6 ~ "Multimarca",
                          ap29 == -9 ~ "Blanco"),
         ap34b = case_when(ap34b == 1 ~ "Sirven para saber cuáles son mis errores",
                           ap34b == 2 ~ "Sirven para aprobar la materia",
                           ap34b == 3 ~ "Sirven para saber si entiendo lo que me enseñaron",
                           ap34b == -1 ~ "No corresponde",
                           ap34b == -6 ~ "Multimarca",
                           ap34b == -9 ~ "Blanco"),
         ap46c = case_when(ap46c == 1 ~ "Sí, siempre que quiero",
                           ap46c == 2 ~ "Sí, solo para hacer tareas",
                           ap46c == 3 ~ "No",
                           ap46c == -1 ~ "No corresponde",
                           ap46c == -6 ~ "Multimarca",
                           ap46c == -9 ~ "Blanco"),
         ap46c = case_when(ap47 == 1 ~ "Seguir estudiando",
                           ap47 == 2 ~ "Trabajar",
                           ap47 == 3 ~ "Trabajar y estudiar",
                           ap47 == 4 ~ "Aún no se",
                           ap47 == -1 ~ "No corresponde",
                           ap47 == -6 ~ "Multimarca",
                           ap47 == -9 ~ "Blanco"),
         ap49 = case_when(ap49 == 1 ~ "Tengo vision reducida",
                          ap49 == 2 ~ "No quedaban cuadernillos de tamaño regular",
                          ap49 == -1 ~ "No corresponde",
                          ap49 == -6 ~ "Multimarca",
                          ap49 == -9 ~ "Blanco"),
         cod_provincia = case_when(cod_provincia == 2 ~ "Ciudad Autónoma de Buenos Aires",
                                   cod_provincia == 6 ~ "Buenos aires",
                                   cod_provincia == 10 ~ "Catamarca",
                                   cod_provincia == 14 ~ "Córdoba",
                                   cod_provincia == 18 ~ "Corrientes",
                                   cod_provincia == 22 ~ "Chaco",
                                   cod_provincia == 26 ~ "Chubut",
                                   cod_provincia == 30 ~ "Entre Ríos",
                                   cod_provincia == 34 ~ "Formosa",
                                   cod_provincia == 38 ~ "Jujuy",
                                   cod_provincia == 42 ~ "La Pampa",
                                   cod_provincia == 46 ~ "La Rioja",
                                   cod_provincia == 50 ~ "Mendoza",
                                   cod_provincia == 54 ~ "Misiones",
                                   cod_provincia == 58 ~ "Neuquén",
                                   cod_provincia == 62 ~ "Río Negro",
                                   cod_provincia == 66 ~ "Salta",
                                   cod_provincia == 70 ~ "San Juan",
                                   cod_provincia == 74 ~ "San Luis",
                                   cod_provincia == 78 ~ "Santa Cruz",
                                   cod_provincia == 82 ~ "Santa Fe",
                                   cod_provincia == 86 ~ "Santiago del Estero",
                                   cod_provincia == 90 ~ "Tucumán",
                                   cod_provincia == 94 ~ "Tierra del Fuego"),
         sector = case_when(sector == 1 ~ "Estatal",
                            sector == 2 ~ "Privado"),
         ambito = case_when(ambito == 1 ~ "Urbano",
                            ambito == 2 ~ "Rural"),
         ICSE = case_when(ICSE == 1 ~ "Bajo",
                          ICSE == 2 ~ "Medio",
                          ICSE == 3 ~ "Alto",
                          ICSE == 4 ~ "No corresponde"))


# Renombrado select ####

datos <- datos %>%
  rename(edad = ap1,
         sexo = ap2,
         pais = ap3a,
         internet = ap7d,
         computadora = ap8b,
         educacion_madre = ap10,
         educacion_padre = ap11,
         tiene_celular = ap46a,
         tiene_internet = ap46b,
         usa_celular = ap46c,
         provincia = cod_provincia,
         sector = sector,
         ambito = ambito,
         ponder = ponder,
         lpondera = lpondera,
         mpondera = mpondera,
         isocioa = isocioa,
         isocioal = isocioal,
         isocioam = isocioam,
         ICSE = ICSE,
         iclima = iclima,
         iclimal = iclimal,
         iclimam = iclimam,
         resultado_lengua = TEL,
         resultado_matematica = TEM)

# Conversion para SQL
datos$tiene_celular <- as.character(datos$tiene_celular)
datos$tiene_internet <- as.character(datos$tiene_internet)
datos$iclima <- as.character(datos$iclima)
datos$iclimam <- as.character(datos$iclimam)
datos$iclimal <- as.character(datos$iclimal)
datos$educacion_madre <- as.character(datos$educacion_madre)
datos$educacion_padre <- as.character(datos$educacion_padre)
datos$isocioa <- as.character(datos$isocioa)
datos$isocioal <- as.character(datos$isocioal)
datos$isocioam <- as.character(datos$isocioam)
datos$computadora <- as.character(datos$computadora)
datos$internet <- as.character(datos$internet)
datos$pais <- as.character(datos$pais)




# Tablas ###

## Alumnos -----
 
alumno <- datos %>%
  select(id_alumno,	id_hogar,	id_escuela,	id_pais,	sexo,	edad,	tiene_celular,	usa_celular, 
         tiene_internet, resultado_lengua, resultado_matematica,	ponder,	lpondera,	mpondera)

otros_alumno <- datos %>%
  select(id_alumno, ap13,	ap14,	ap15a,	ap15b,	ap15c,	ap16,	ap17,	ap18,	ap19,	ap20,	ap21,	ap22,	ap23,	
         ap24,	ap25,	ap26a,	ap26b,	ap26c,	ap26d,	ap26e,	ap26f,	ap26g,	ap26h,	ap27,	
         ap28,	ap30a,	ap30b,	ap30c,	ap30d,	ap30e,	ap30f,	ap30g,	ap30h,	ap31a,	ap31b,	
         ap31c,	ap32a,	ap32b,	ap32c,	ap33a,	ap33c,	ap33d,	ap33e,	ap33f,	ap33g,	ap34a,	
         ap34b,	ap35a,	ap35b,	ap35d,	ap35e,	ap35f,	ap35g,	ap35h,	ap35i,	ap35j,	ap36,	
         ap37b,	ap37c,	ap37d,	ap37e,	ap37f,	ap37g,	ap37h,	ap38,	ap41,	ap42,	ap43,	ap44a,	
         ap44b,	ap44c,	ap44d,	ap44e,	ap44f,	ap45a,	ap45e,	ap45f,	ap45g,	ap45h,	ap47,	
         ap48a,	ap48b,	ap48c,	ap49,	ldesemp,	mdesemp,	autoconlengua,	
         autoconmatematica,	autoconlengual,	autoconmatematicam)


## Hogar ----

hogar <- datos %>%
  select(id_hogar, educacion_madre, educacion_padre, isocioa, isocioal, isocioam, computadora, internet) %>%
  group_by(id_hogar) %>%
  slice(1)

otros_hogar <- datos %>%
  select(id_hogar, ap3b,	ap3c,	ap5a,	ap5b,	ap5c,	ap5d,	ap5e,	ap5f,	ap5g,	ap5h,	ap6,	
         ap7a,	ap7b,	ap7c,	ap8a,	ap8c,	ap8d,	ap8e,	ap8f,	ap8g,	ap12) %>%
  group_by(id_hogar) %>%
  slice(1)


## Escuela ---

escuela <- datos %>%
  select(id_escuela, id_jurisdiccion, ambito, sector, iclima, iclimam, iclimal, ICSE) %>%
  group_by(id_escuela) %>%
  slice(1)


## Jurisdiccion ----

jurisdiccion <- datos %>%
  select(id_jurisdiccion,	provincia) %>%
  group_by(id_jurisdiccion) %>%
  slice(1)


## Pais ----

pais <- datos %>%
  select(id_pais,	pais) %>%
  group_by(id_pais) %>%
  slice(1)



# Save ####

ruta_script <- "C:/Users/German/Desktop/data"
setwd(ruta_script)
write.csv(datos,'aprender.csv', fileEncoding = "UTF-8")
write.csv(alumno,'alumno.csv', fileEncoding = "UTF-8")
write.csv(otros_alumno,'otros_alumno.csv', fileEncoding = "UTF-8")
write.csv(escuela,'escuela.csv', fileEncoding = "UTF-8")
write.csv(hogar,'hogar.csv', fileEncoding = "UTF-8")
write.csv(otros_hogar,'otros_hogar.csv', fileEncoding = "UTF-8")
write.csv(jurisdiccion,'jurisdiccion.csv', fileEncoding = "UTF-8")
write.csv(pais,'pais.csv')







# String de id ####
a <- datos$id_escuela[1]
str_length(a)

b <- datos$id_hogar[1]
c <- datos$id_hogar[28465]

str_length(b)
str_length(c)

rm(a, b, c, x)



# Cálculo de promedio ponderado #####
 
 
mates <- alumno %>%
  summarise(prom = weighted.mean(resultado_matematica, mpondera, na.rm = TRUE))
