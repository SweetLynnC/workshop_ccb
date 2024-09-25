
# setup -------------------------------------------------------------------

rm(list = ls())

library(rgbif)
library(tidyverse)

# data --------------------------------------------------------------------

key <- 
  name_backbone("Abronia villosa") |> 
  pull(usageKey)


gbif_download <- 
  occ_download(
    pred("taxonKey", key),format = "SIMPLE_CSV",
    user = 'lynnsweet',
    pwd = 'C0mmonHawk$',
    email = 'lynn.sweet@ucr.edu')

occ_download_wait(gbif_download)

#pipe is shift-ctrl-M
gbif_download |> 
  write_rds('data/raw/key.rds')

gbif_download |> 
  read_rds(
    file = "data/raw/key.rds")

read_rds

#get it locally
data <- 
  occ_download_get(
    gbif_download, 
    path = 'data/raw', 
    overwrite = TRUE,
    user = 'lynnsweet',
    pwd = 'C0mmonHawk$',
    email = 'lynn.sweet@ucr.edu') |> 
  occ_download_import()

# save data ---------------------------------------------------------------

data |> 
  write_csv('data/raw/abronia_gbif_raw.csv')
