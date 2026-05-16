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

gearCounts <- mtcars |>
  count(gear)

del1Draft <- ggplot(gearCounts, aes(
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
    x = "",
    y = "Gear"
  ) +
  
  theme_minimal()

del1Draft

# save del1Draft ----------------------------------------------------------

saveRDS(del1Draft, file = "del1Draft.rds")

# deliverable 2 ----------------------------------------------------------

carbCounts <- mtcars %>%
  count(carb)

del2Draft <- ggplot(
  carbCounts,
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
    x = "CARB",
    y = ""
  ) +
  
  theme_minimal()

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
    x = "cylinders",
    y = "Count"
  ) +
  
  theme_minimal()

del3Draft

# save del3Draft ----------------------------------------------------------

saveRDS(del3Draft, file = "del3Draft.rds")
