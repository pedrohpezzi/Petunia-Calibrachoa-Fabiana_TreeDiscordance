data <- data.frame(
  Topology = c("Topology 1", "Topology 2", "Topology 3"),
  Frequency = c(1002, 119, 103)
)

bar_plot <- barplot(data$Frequency, names.arg = data$Topology, col = "blue", main = "Frequency of Highest Values")

text(bar_plot, data$Frequency + 20, labels = data$Frequency, pos = 3, col = "black")

text(bar_plot, -5, labels = data$Topology, pos = 1, col = "black", xpd = TRUE)

# Set y-axis ticks and labels every 250 units
axis(2, at = seq(0, max(data$Frequency) + 250, by = 250))

# Add p-values above "Topology 2" and "Topology 3" with connecting lines
p_values <- c("", "0.2829", "0.2829")  # P-values for each topology
segments(x0 = bar_plot[2], x1 = bar_plot[3], y0 = max(data$Frequency) + 60, y1 = max(data$Frequency) + 60)
text(x = mean(bar_plot[2:3]), y = max(data$Frequency) + 80, labels = p_values[2:3], col = "black")


Calculate chi square

twisst <- c(119, 103)
res <- chisq.test(twisst, p = c(1/2, 1/2))
res
