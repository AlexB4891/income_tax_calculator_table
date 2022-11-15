example <- iris %>%
  group_by(Species) %>%
  summarise(sum = sum(Sepal.Length)) %>% 
  ungroup() 


tabla_gt <- example %>% 
  mutate(ingresos = 900,
         gastos = sum(sum),
         resto = gastos-sum,
         saldo = ingresos - resto - sum,
         ) %>% 
  group_by(Species) %>% 
  nest(porcentajes = c(sum,resto,saldo)) %>% 
  mutate(porcentajes = map(porcentajes,pivot_longer,everything()),
         graficos = map(porcentajes,
                        ~.x %>% 
                          ggplot() +
                          geom_col(mapping = aes(x = "percent",y = value,fill = name),position = "stack") +
                          coord_flip() +
                          theme_void()
                          )) 

tabla_gt %>% 
  mutate(a = NA_character_) %>% 
  ungroup() %>% 
  gt() %>% 
  gt::cols_hide(c(porcentajes,graficos)) %>% 
  text_transform(
      locations = cells_body(columns = vars(a)),
      fn = function(x) {

        # map(x,class)
        map(tabla_gt$graficos,ggplot_image,height = px(50))
        # ggplot_image(plot_object = .$graficos,height = px(200))
      }
    )



tibble(a = c(1,2,3),
       b = "",
       c = "a") %>%
  summarise(
    mpg = spk_chr(
      a, type="bullet"
      
    )
  ) %>%
  formattable() %>%
  formattable::as.htmlwidget() %>%
  spk_add_deps()


hp_table <- function(x){
  gt(x) %>% 
    data_color(columns = c("hp"), 
               colors = col_numeric(palette = "Blues", 
                                    domain = c(0, 400))) %>% 
    tab_options(column_labels.hidden = TRUE) %>% 
    as_raw_html() # return as html
}

good_mpg_table <- 
  mtcars %>% 
  mutate(good_mpg = ifelse(mpg > 20, "Good mileage", "Bad mileage"), 
         car_name = row.names(.)) %>% 
  filter(good_mpg == "Good mileage") %>%
  head(5) %>% 
  arrange(hp) %>% 
  select(car_name, hp) %>% 
  hp_table()

bad_mpg_table <- 
  mtcars %>% 
  mutate(good_mpg = ifelse(mpg > 20, "Good mileage", "Bad mileage"), 
         car_name = row.names(.)) %>% 
  filter(good_mpg == "Bad mileage") %>% 
  head(5) %>% 
  arrange(hp) %>% 
  select(car_name, hp) %>% 
  hp_table() 

data_tables <- data.frame(good_table = good_mpg_table, 
                          bad_table = bad_mpg_table)

data_tables %>% 
  gt() %>% 
  fmt_markdown(columns = TRUE) %>% #render cell contents as html
  cols_label(good_table = "High mileage", 
             bad_table = "Low mileage")


income <- 2000000


tax_resources <- franjas %>% 
  mutate(comparacion = income,
         across(.cols = c(fraccion_basica,exceso_hasta,impuesto_fraccion ),as.numeric),
         regla = comparacion > fraccion_basica & comparacion < exceso_hasta,
         cuota = if_else(income > 24090.3,0.1,0.2)) %>% 
  filter(regla) %>% 
  select(fraccion_basica,
         impuesto_fraccion,
         impuesto_excedente,
         cuota)


tax_resources %>% 
  mutate(across(c(fraccion_basica,
                  impuesto_fraccion),
                scales::dollar),
         across(c(impuesto_excedente,
                  cuota),scales::percent)) %>% 
  pivot_longer(cols = everything()) %>% 
  mutate(name = case_when(
    name == "fraccion_basica" ~ "Fracción básica",
    name == "impuesto_fraccion" ~ "Impuesto sobre la fracción básica",
    name == "impuesto_excedente" ~ "Tasa sobre el excedente",
    name == "cuota" ~ "Cuota deducible"
  )) %>% 
  gt() %>% 
  tab_options(table.background.color = "#051052") %>%
  cols_label(
    name = md(""),
    value = md("**Valor**")
  )
  




tibble(a = c(1,2,8,1.4),
       b = "",
       c = "a") %>%
  mutate(
    a = spk_chr(
      a, 
      type="bullet",
      tooltipValueLookups= htmlwidgets::JS(
        " { fields: {r: 'Ingresos', p: 'Total gastos', t: 'Vivienda'} }"
      )
      
    )
  ) %>%
  formattable() %>%
  formattable::as.htmlwidget() %>%
  spk_add_deps()
  

exem <- tibble(a = list(c(1,2,8,1.4)),
       b = "",
       c = "a") 

exem %>% 
  gt() %>% 
  text_transform(
    locations = cells_body(b),
    fn = function(x){
      sparkline_ <- map(exem$a,
                       
                       
                       
                       ~{
                         
                         # browser()
                         
                         spk_chr(values = .x, 
                                type="bullet"
                                # ,
                                # tooltipValueLookups= htmlwidgets::JS(
                                #   " { fields: {r: 'Ingresos', p: 'Total gastos', t: 'Vivienda'} }")
                                )
                         
                         
                         })
      map(sparkline_, gt::html)
    }
)


sparkline(0)

tibble(
  var = c("mpg", "wt"),
  sparkline1 = "",
  sparkline2 = "",
  box = ""
) %>% 
  gt() %>% 
  text_transform(
    locations = cells_body(vars(sparkline1)),
    fn = function(x){
      sparkline <- map(list(mtcars$mpg, mtcars$wt), ~spk_chr(values = .x, chartRangeMin = 0))
      map(sparkline, gt::html)
    }
  ) %>% 
  text_transform(
    locations = cells_body(vars(sparkline2)),
    fn = function(x){
      sparkline <- map(list(mtcars$mpg, mtcars$wt), ~spk_chr(values = .x, type = "bar", chartRangeMin = 0))
      map(sparkline, gt::html)
    }
  ) %>% 
  text_transform(
    locations = cells_body(vars(box)),
    fn = function(x){
      sparkline <- map(list(mtcars$mpg, mtcars$wt), ~spk_chr(values = .x, type = "box", chartRangeMin = 0))
      map(sparkline, gt::html)
    }
  )
