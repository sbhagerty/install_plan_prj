library(shiny)
library(gt)
library(tidyverse)
library(fs)
library(waiter)

file_paths <- fs::dir_ls("R")
purrr::map(file_paths, function(path){source(path)})

checklist_df <- get_checklist()
