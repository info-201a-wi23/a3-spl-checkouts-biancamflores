library(dplyr)
library(ggplot2)

data <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

top_books <- data %>%
  group_by(CheckoutYear, Title) %>%
  summarize(Checkouts = sum(Checkouts), .groups = "drop_last") %>%
  arrange(CheckoutYear, desc(Checkouts)) %>%
  group_by(CheckoutYear) %>%
  top_n(1, Checkouts)

chart1 <- ggplot(top_books, aes(x = CheckoutYear, y = Checkouts, fill = Title)) +
  geom_bar(stat = "identity") +
  xlab("Year") + ylab("Checkouts") +
  ggtitle("Most checked out book per year") +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust = 0, size = 4, lineheight = 0.6))


