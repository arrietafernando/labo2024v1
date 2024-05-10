
set.seed(123)

# Grid
t <- seq(0, 1, by = 0.1)
p <- length(t) - 1

# 5 paths
n <- 5
I <- matrix(rnorm(n * p, 0, 1 / sqrt(p)), n, p)

# Data frame
df1 <- data.frame(apply(I, 1, cumsum))

# install.packages("reshape")
library(reshape)

df <- data.frame(x = seq_along(df1[, 1]),
                 df1)

# Long format
df <- melt(df, id.vars = "x")

# install.packages("ggplot2")
# install.packages("ggrepel")
library(ggplot2)
library(ggrepel)

# Color selection
cols <- c("#D43F3A", "#EEA236", "#5CB85C", "#46B8DA", "#9632B8")

ggplot(df, aes(x = x, y = value, color = variable)) +
  geom_point() +
  geom_line(linewidth=2) +
  scale_color_manual(values = cols) +
  geom_label_repel(aes(label = sprintf("%.2f", value), size=1), box.padding=0.8, min.segment.length=0) +
  ggtitle("Título del gráfico") +
  theme_minimal() +
  theme( panel.grid.major.x = element_blank(),
         panel.grid.minor.x = element_blank(), 
         legend.position="bottom",
         plot.title = element_text(hjust = 0.5) )
  


ggplot(df, aes(x = x, y = value, color = variable)) +
  geom_point() +
  geom_line(linewidth=2) +
  scale_color_manual(values = cols) +
  geom_label(aes(label = sprintf("%.2f", value)), label.padding=unit(0.2, "lines")) +
  ggtitle("Título del gráfico") +
  theme_minimal() +
  theme( panel.grid.major.x = element_blank(),
         panel.grid.minor.x = element_blank(), 
         legend.position="bottom",
         plot.title = element_text(hjust = 0.5) )

