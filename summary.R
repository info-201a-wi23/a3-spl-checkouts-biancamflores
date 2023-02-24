library(dplyr)
library(stringr)

spl_data <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

spl_data <- spl_data %>% mutate(date = as.Date(paste0(CheckoutYear, '-', CheckoutMonth,'-01'),'%Y-%m-%d'))

material_totals <- spl_data %>% 
  group_by(MaterialType) %>%
  summarize(totals =  sum(Checkouts)) %>%
  arrange(-totals)
material_totals_max <- spl_data %>% 
  group_by(MaterialType) %>%
  summarize(totals =  sum(Checkouts)) %>%
  filter(totals == max(totals)) %>%
  pull(MaterialType)

top_book <- spl_df %>%
  filter(date == as.Date("2022-09-01")) %>%
  group_by(Title) %>%
  summarize(most_checked = max(Checkouts)) %>%
  filter(most_checked == max(most_checked)) %>%
  pull(Title)

total_materialtype_checkouts <- data %>%
  group_by(MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts))

data %>%
  filter(MaterialType == "EBOOK") %>%
  summarise(avg_checkouts = mean(Checkouts))


data %>%
  filter(MaterialType == "BOOK") %>%
  summarise(avg_checkouts = mean(Checkouts))