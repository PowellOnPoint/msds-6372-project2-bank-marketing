library(ggplot2)
library(scales)

# Project color palette
bank_colors <- c(
  teal       = "#298C81",
  dark_teal  = "#176B63",
  slate      = "#253746",
  blue       = "#5B8DB8",
  light_blue = "#D9E2E8",
  gray       = "#64748B",
  light_gray = "#F1F5F9",
  white      = "#FFFFFF",
  coral      = "#E07A5F"
  
)

# Colors for subscription status
subscription_colors <- c(
  "no"  = bank_colors["light_blue"],
  "yes" = bank_colors["teal"]
)

# Remove inherited names
subscription_colors <- unname(subscription_colors)
names(subscription_colors) <- c("no", "yes")

theme_bank <- function(base_size = 12) {

  theme_minimal(base_size = base_size) +

    theme(
      # Titles
      plot.title = element_text(
        face = "bold",
        size = rel(1.3),
        color = bank_colors["slate"],
        margin = margin(b = 8)
      ),

      plot.subtitle = element_text(
        size = rel(0.95),
        color = bank_colors["gray"],
        margin = margin(b = 12)
      ),

      # Axis labels
      axis.title = element_text(
        face = "bold",
        color = bank_colors["slate"]
      ),

      axis.text = element_text(
        color = bank_colors["gray"]
      ),

      # Gridlines
      panel.grid.major.x = element_line(
        color = bank_colors["light_blue"],
        linewidth = 0.3
      ),

      panel.grid.major.y = element_line(
        color = bank_colors["light_blue"],
        linewidth = 0.3
      ),

      panel.grid.minor = element_blank(),

      # Facet headers
      strip.text = element_text(
        face = "bold",
        color = bank_colors["slate"],
        size = rel(0.95)
      ),

      # Legends
      legend.position = "bottom",
      legend.title = element_text(face = "bold"),
      legend.text = element_text(
        color = bank_colors["slate"]
      ),

      # Background
      plot.background = element_rect(
        fill = "white",
        color = NA
      ),

      panel.background = element_rect(
        fill = "white",
        color = NA
      ),

      # Captions
      plot.caption = element_text(
        color = bank_colors["gray"],
        size = rel(0.8),
        hjust = 1
      ),

      # Spacing
      plot.margin = margin(15, 20, 15, 15)
    )
}

