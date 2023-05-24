library(tidyverse)
library(readxl)


# treefall records    ------------------------------------------------------

treefalls <- read_excel("./data/data_raw/Hacuminata_98-05_27may_Paul.xls",
  sheet = "treefall records",
  col_names = FALSE
) %>%
  janitor::remove_empty(which = "rows") %>%
  mutate(index = row_number(), .before = 1)


names(treefalls) <- c("index", "plot", "year", "row", "column", "notes", "x1", "x2", "x3")


del_index <- c(56, 57, 58, 71, 77)
treefalls <- treefalls %>%
  filter(!index %in% del_index) %>%
  mutate_all(as.character)

row1 <- as_tibble(t(c("71", "florestal", "2007", "A", "4", "90% de área com queda de árvore")))
row2 <- as_tibble(t(c("56", "5750", "2007", "J", "8", "gap")))
row3 <- as_tibble(t(c("58", "5750", "2007", "D", "9", "galhos caídos em cerca de 10% de sua área/borda com E9")))
row4 <- as_tibble(t(c("77", "florestal", "2007", "A", "8", "20% de queda")))
row5 <- as_tibble(t(c("57", "5750", "2007", "I", "10", "10% da parcela com galhada")))
corrections <- bind_rows(row1, row2, row3, row4, row5)
names(corrections) <- c("index", "plot", "year", "row", "column", "notes")

treefalls <- bind_rows(corrections, treefalls) %>%
  arrange(index) %>%
  select(-(x1:x3))

missing_subplot <- as_tibble(str_extract(treefalls$notes, "[A-Z]+[:digit:]"))
treefalls$missing_subplot <- missing_subplot$value
treefalls <- treefalls %>%
  unite("subplot", row:column, na.rm = TRUE, remove = TRUE, sep = "") %>%
  # mutate(subplot=paste(row,column,sep="")) %>%
  mutate(subplot = ifelse(subplot == "", missing_subplot, subplot)) %>%
  select(-missing_subplot)



cover <- as_tibble(str_extract(treefalls$notes, "[:digit:]+[//%]"))
treefalls$perc_cover <- cover$value
treefalls$perc_cover <- gsub("%", "", treefalls$perc_cover)
treefalls <- treefalls %>%
  mutate(plot = case_when(
    plot == "2107" ~ "FF-1",
    plot == "2108" ~ "FF-2",
    plot == "2206" ~ "FF-5",
    plot == "5756" ~ "CF-3",
    plot == "5750" ~ "CF-2",
    plot == "5751" ~ "FF-3",
    plot == "5752" ~ "FF-2",
    plot == "5753" ~ "FF-3",
    plot == "CF-CF" ~ "CF-6",
    plot == "Colosso-1" ~ "FF-3",
    plot == "Colosso-10" ~ "FF-6",
    plot == "PA CF" ~ "CF-5",
    plot == "PA-CF" ~ "CF-5",
    plot == "PA1" ~ "FF-4",
    plot == "PA-10" ~ "FF-7",
    plot == "Dim-CF" ~ "CF-4",
    plot == "Florestal" ~ "CF-1",
    plot == "florestal" ~ "CF-1",
    plot == "cf cf" ~ "CF-6",
    plot == "dim cf" ~ "CF-4",
    TRUE ~ plot
  ))

unique(treefalls$plot)
#
#
# plot is a mess due to treefall
# trefall covers subplot
# plot covered by trefall
# subplot almost entirely treefall
# plot is a mess due to treefall
# plot is  pletely covered by trefall
# horrible treefall in plot
# horrible treefall in plot, can barely make it in
# grande treefall in plot
# grande treefall in plot
# trefall/fallen branches in plot
# trefall/fallen branches in plot
# treefall in plot inteira, planta que falta must be embaixo
# arvore treefall in plot/ as planats missing devem estar embaixo da arvore
# subplot is 100% treefall
# big treefall in plot
# treefall in plot
# treefall in plot
# A sub-parcela C1 tem cerca de 25% com queda de casca de um gigante angelim
# E10  com muitas folhas de embaúbas na liteira
# Área de D2 com 20% de galhada
# C4 possui cerca de 25% com queda de galhada
# Sub-parcela A7 e A8 com muitas folhas grandes na liteira
# E8 possui 40% de galhos caídos na parcela
# E9 árvores caíram
# plot  PLETELY covered with treefall, almost can't get in.
# Árvore podre caída na C9
# B7 com 10% da área com queda de falhada
# B5 com cerca de 20% da área da parcela com queda de galhada
# Parcela C1 com 15% de galhada em cima
# 70% da parcela C4 com galhada
# C7 com 25% com galhada
# gap
# 10% da parcela com galhada
# galhos caídos em cerca de 10% de sua área/borda com E9
# F9 com 10% de galhada
# plot  PLETELY covered with treefall, almost can't get in.
# G9 com 10% de galhada (borda F9)
# J9 com clareira
# 40% da área de E5 com caída de galhada
# 10 % da área da sub-parcela A2 com queda de árvore
# 25% da área da sub-parcela A1 com queda de árvore
# 30% de área da parcela com caída de galhada
# caiu grande galhada em A1(30%)
# 20% da área de B7 com galhada
# 20% da área de B8  com galhada
# C7 com 20% de sua área com queda de galhada
# plot  PLETELY covered with treefall, almost can't get in.
# C8 com 25% de sua área com queda de galhada
# 90% de área com queda de árvore
# A7 com 20% da área com queda de árvore
# B4 com 30% da área com queda de árvore
# B8 com 15% de área com caída
# B9 com 20% de área com queda de árvore
# C9 com 30% de caída
# 20% de queda
# plot covered by trefall
# plot covered by trefall

treefalls <- treefalls %>%
  mutate(notes = case_when(
    notes == "plot covered by trefall" ~ "subplot covered by treefall",
    notes == "trefall covers subplot" ~ "subplot covered by treefall",
    notes == "plot is  pletely covered by trefall" ~ "subplot covered by treefall",
    notes == "trefall" ~ "treefall in subplot",
    notes == "trefall in plot" ~ "treefall in subplot",
    notes == "trefall/fallen branches in plot" ~ "treefall/fallen branches",
    notes == "arvore treefall in plot/ as planats missing devem estar embaixo da arvore" ~ "treefall in plot, missing plants must be underneath",
    notes == "treefall in plot inteira, planta que falta must be embaixo" ~ "subplot covered by treefall",
    notes == "plot  PLETELY covered with treefall, almost can't get in." ~ "subplot plot is completely covered with treefall, almost can't get in.",
    TRUE ~ as.character(notes)
  )) %>%
  mutate(notes = gsub("trefall", "treefall", notes)) %>%
  mutate(perc_cover = case_when(
    notes == "subplot covered by treefall" ~ "100",
    notes == "subplot plot is completely covered with treefall, almost can't get in." ~ "100",
    TRUE ~ as.character(perc_cover)
  )) %>%
  mutate(notes = gsub("trefall", "treefall", notes))
# mutate(notes=gsub("grande","big",notes)) %>%

unique(treefalls$notes)
