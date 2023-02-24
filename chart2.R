library(ggplot2)
library(dplyr)
data <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

data_for_22 <- data %>% filter(CheckoutYear == "2022")


book_checkouts <- data_for_22 %>%
  filter(MaterialType == "book") %>%
  group_by(CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts))

ebook_checkouts <- data_for_22 %>%
  filter(MaterialType == "ebook") %>%
  group_by(CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts))

chart2 <- ggplot(data_for_22) +
  geom_line(data = book_checkouts, aes(x = CheckoutMonth, y = total_checkouts, color = "Books")) +
  geom_line(data = ebook_checkouts, aes(x = CheckoutMonth, y = total_checkouts, color = "Ebooks")) +
  labs(title = "Checkouts for ebooks and total books per month", x = "Month", y = "Checkouts total", color = "Format") +
  scale_color_manual(values = c("red", "blue")) +
  scale_x_continuous(breaks = seq(1, 12))
