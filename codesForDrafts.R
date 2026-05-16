# clean memory ------------------------------------------------------------
rm(list = ls())
library(ggplot2)
library(dplyr)

# read in data ------------------------------------------------------------

mtcars

# see data ----------------------------------------------------------

head(mtcars)

# see data types ----------------------------------------------------------

str(mtcars)

# deliverable 1 ----------------------------------------------------------

del1Data <- mtcars |> 
  count(gear)

del1Draft <- ggplot(del1Data, aes(
  x = n,
  y = factor(gear))) +
  
  geom_col(fill = "lightgray") +
  
  geom_text(aes(label = n),
            color = "blue",
            size = 8,
            hjust = 1.3
  ) +
  labs(
    title = "Count of Cars per GEAR",
    caption = "Source: mtcars data",
    x = "",
    y = "Gear"
  ) +
  scale_x_continuous(
    expand = expansion(mult = c(0, .15))
  ) +
  theme_minimal() +
  
  theme(
    plot.margin = margin(10, 20, 10, 10)
  )

del1Draft

# save del1Draft ----------------------------------------------------------

saveRDS(del1Draft, file = "del1Draft.rds")

# deliverable 2 ----------------------------------------------------------

del2Data <- mtcars |>
  count(carb)

del2Draft <- ggplot(
  del2Data,
  aes(
    x = factor(carb),
    y = n
  )
) +
  
  geom_col(fill = "yellow") +
  
  geom_text(
    aes(label = n),
    vjust = -0.5,
    color = "darkgreen",
    size = 5
  ) +
  
  labs(
    title = "Count of Cars per CARB",
    caption = "Source: mtcars data",
    x = "CARB",
    y = ""
  ) +
  theme(
    plot.margin = margin(10, 10, 10, 10)
  ) +
  theme_minimal() +
  scale_y_continuous(expand = expansion(mult = c(0, .15)))

del2Draft

# save del2Draft ----------------------------------------------------------

saveRDS(del2Draft, file = "del2Draft.rds")

# deliverable 3 ----------------------------------------------------------

del3Data <- mtcars |>
  count(gear, carb, cyl)

del3Draft <- ggplot(del3Data,
  aes(x = factor(cyl),
    y = n
  )
) +
  
  geom_col(fill = "yellow") +
  
  geom_text(
    aes(label = n),
    vjust = -0.5,
    color = "darkgreen",
    size = 3
  ) +
  
  facet_grid(
    rows = vars(gear),
    cols = vars(carb)
  ) +
  
  labs(
    title = "Only 5-gear cars utilize the 6 and 8 carburetor setups.",
    caption = "Source: mtcars data",
    x = "cylinders",
    y = "Count"
  ) +
  theme_minimal() +
  theme(
    plot.margin = margin(20, 10, 10, 10)
  ) +
  theme(plot.caption = element_text(
      hjust = 1,
      size = 8,
      color = "gray40"
    )) +
      scale_y_continuous(expand = expansion(mult = c(0, .15)))

del3Draft

# save del3Draft ----------------------------------------------------------

saveRDS(del3Draft, file = "del3Draft.rds")
