# load the libraries ------------------------------------------------------
library(cowplot)
library(ggplot2)

# Fig with all ONE HA plots  ----------------------------------------------

ff_one_all <- ggdraw() +
  draw_image("./docs/maps/images/Slide1.jpeg", x = -0.26, y = 0.2, scale = .5) +
  draw_image("./docs/maps/images/Slide2.jpeg", x = 0.26, y = 0.2, scale = .5) +
  draw_image("./docs/maps/images/Slide3.jpeg", x = -0.26, y = -0.15, scale = .5) +
  draw_image("./docs/maps/images/Slide4.jpeg", x = 0.26, y = -0.15, scale = .5)

# save the figures in multiple formats
ggsave("./docs/maps/images/ff_one_all.pdf", width = 7, height = 10, units = "in", bg = "white")
ggsave("./docs/maps/images/ff_one_all.png", width = 7, height = 10, units = "in", bg = "white")
ggsave("./docs/maps/images/ff_one_all.tiff", width = 7, height = 10, units = "in", bg = "white")


# Fig with all TEN HA plots  ----------------------------------------------

ff_ten_all <- ggdraw() +
  draw_image("./docs/maps/images/Slide5.jpeg", x = -0.26, y = 0.2, scale = .5) +
  draw_image("./docs/maps/images/Slide6.jpeg", x = 0.26, y = 0.2, scale = .5) +
  draw_image("./docs/maps/images/Slide7.jpeg", x = 0, y = -0.2, scale = .5)

# Save the figures in multiple formats
ggsave("./docs/maps/images/ff_ten_all.pdf", width = 7, height = 10, units = "in", bg = "white")
ggsave("./docs/maps/images/ff_ten_all.png", width = 7, height = 10, units = "in", bg = "white")
ggsave("./docs/maps/images/ff_ten_all.tiff", width = 7, height = 10, units = "in", bg = "white")


# Fig with all CONTINUOUS FOREST plots  -----------------------------------

cf_all <- ggdraw() +
  draw_image("./docs/maps/images/Slide8.jpeg", x = -0.26, y = 0.3, scale = .5) +
  draw_image("./docs/maps/images/Slide9.jpeg", x = 0.26, y = 0.3, scale = .5) +
  draw_image("./docs/maps/images/Slide10.jpeg", x = -0.26, y = -0.01, scale = .5) +
  draw_image("./docs/maps/images/Slide11.jpeg", x = 0.26, y = -0.01, scale = .5) +
  draw_image("./docs/maps/images/Slide12.jpeg", x = -0.26, y = -0.325, scale = .5) +
  draw_image("./docs/maps/images/Slide13.jpeg", x = 0.26, y = -0.28, scale = .5)

# Save the figures in multiple formats
ggsave("./docs/maps/images/cf_all.pdf", width = 7, height = 10, units = "in", bg = "white")
ggsave("./docs/maps/images/cf_all.png", width = 7, height = 10, units = "in", bg = "white")
ggsave("./docs/maps/images/cf_all.tiff", width = 7, height = 10, units = "in", bg = "white")
