library(data.table)
library(tidyverse)
dm0 <- fread("C:/Users/Ivan Mendivelso/Downloads/Dim2_Pre_ConsolidatedReport.csv")
glimpse(dm0)

## ¿Cuántas empresas hay?

persona <- dm0 %>%
  count(nombre_completo_evaluado, empresa) %>%
  select(nombre_completo_evaluado, empresa) %>%
  set_names("Nombre", "Empresa")

persona_evaluacion <- dm0 %>%
  count(nombre_completo_evaluado, empresa, evaluacion) %>%
  select(nombre_completo_evaluado, empresa, evaluacion) %>%
  count(nombre_completo_evaluado, empresa) %>%
  set_names(c("Nombre", "Empresa", "Evaluaciones"))

distr_eval_empresa <- persona_evaluacion %>%
  count(Empresa, Evaluaciones) %>%
  set_names("Empresa", "Evaluaciones", "Personas")

registros_persona <- dm0 %>%
  count(nombre_completo_evaluado, empresa, evaluacion)

persona_cuestionario <- dm0 %>%
  count(nombre_completo_evaluado, empresa, id_cuestionario) %>%
  count(nombre_completo_evaluado, empresa)

