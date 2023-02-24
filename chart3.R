library(ggplot2)

checkouts <- data[data$MaterialType %in% c("book", "ebook","audio book")]

checkouts_by_yr_and_mat <- aggregate(Checkouts ~ MaterialType + CheckoutYear, data = book_checkouts, sum)
chart3 <- ggplot(checkouts_by_yr_and_mat, aes(x = CheckoutYear, y = Checkouts, color = MaterialType)) +
  geom_line() +
  labs(title = "Types of Checkouts Over Time",
       x = "Year",
       y = "Checkouts",
       color = "Materials") +
  scale_color_manual(values = c("#red", "#blue","#green"))

