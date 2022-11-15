library(scales)

set.seed(1984)

vec_gastos <- rnorm(6,100,3)
                  
conceptos <- tibble( concepto = c( str_c("gasto",1:6),"ingreso no gravado"),
                     rubro = c(vec_gastos,800 - sum(vec_gastos))
)

gastos <- sum(conceptos[1:6,2])*12

ingresos <- (conceptos[7,2] + sum(vec_gastos))*12

irenta <- 775.55

segunda_layer <- tibble( concepto = c("gastos deducibles",
                                      "impuesto renta",
                                      "ingreso no gravado"),
                         rubro = c(gastos*0.1,irenta,ingresos - gastos*0.1-irenta)
) %>% unnest()


conceptos <- conceptos %>% mutate(rubro = rubro*12,
                                  cs = cumsum(rubro))

segunda_layer <- segunda_layer %>% mutate(cs = cumsum(rubro))


plot <-
  ggplot() +
  geom_col(data = conceptos,
           mapping = aes(y = "a",
                         x = rubro,
                         fill = concepto),
           position = "stack",width = 0.5) +
  geom_label_repel(data = conceptos,
             mapping = aes(x = cs,
                           y = "a",
                           label = concepto,
                           color = concepto),
             nudge_y = -0.6) +
  geom_label_repel(data = segunda_layer,
             mapping = aes(x = cs,
                           y = "b",
                           label = concepto,
                           color = concepto),
             nudge_y = 0.6) +
  geom_col(data = segunda_layer,
           mapping = aes(y = "b",
                         x = rubro,
                         fill = concepto),
           position = "stack",width = 0.5) +
  scale_x_continuous(labels = dollar) +
  # scale_y_continuous() +
  theme_void() +
  theme(legend.position = "none",
        axis.text.x = element_text(),
        plot.margin = margin( 0,1, 1, 1, "cm"))


