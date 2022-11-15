
# Theme -------------------------------------------------------------------

theme <- bs_theme(
  bg = "#03071e", fg = "white", primary = "#f48c06",
  base_font = font_google("Noto Sans"),
  code_font = font_google("Space Mono"),
  heading_font = font_google("Oswald")
)


app_grid <- shiny.semantic::grid_template(
  default = list(
    areas = rbind(
      c("title",         "title",         "title",        "title",               "title"),
      c("impuesto_renta","impuesto_renta","blank_1",      "relacion_dependencia","relacion_dependencia"),
      c("nombre",        "provincia",     "blank_1",      "edad",                "genero"),
      c("income_gastos", "income_gastos", "blank_1",      "tax_cuota",           "tax_cuota"),
      c("blank_2",       "blank_2",       "blank_2",      "blank_2",             "blank_2"),
      c("blank_3",       "total_tax",     "total_tax",    "total_tax",           "blank_4"),
      c("blank_5",       "blank_5",       "blank_5",      "blank_5",             "blank_5"),
      c("proporciones",  "proporciones",  "blank_6",      "obligaciones",        "obligaciones")
    ),
    cols_width = c("30%","17.5%","5%","17.5%", "30%"),
    rows_height = c("5%", "10%","10%","40%","1%","5%","1%","28%")
  ),
  mobile = list(
    areas = rbind(
      "title",
      "impuesto_renta",
      "relacion_dependencia",
      "nombre",        
      "provincia",
      "edad",                
      "genero",
      "income_gastos",
      "tax_cuota",
      "total_tax",
      "proporciones",
      "obligaciones"
    ),
    rows_height = c("auto", "auto", "auto",
                    "auto", "auto", "auto",
                    "auto", "auto", "auto",
                    "auto", "auto", "auto"),
    cols_width = c("100%")
  )
)

# UI tags -----------------------------------------------------------------

ui <- 
  semanticPage(
    theme = theme,
    suppress_bootstrap = TRUE,
    includeCSS("../app_css.css"),
    grid(app_grid,
         title = 
           # div(),
           HTML("Calculadora de impuesto a la renta"),
         impuesto_renta = div(),
         #   HTML(
         #   # markdown::markdownToHTML(text =  
         #   hover_paragraph(paragraph = read_md_as_paragraph("../app/md/texto_1_impuesto_renta.md"),
         #                   dictionary = "../app/md/glosario_terminos.md",
         #                   class = "hovertext")
         #   # )
         # ),
         relacion_dependencia = div(),
           # HTML(
           # # markdown::markdownToHTML(text = 
           # hover_paragraph(paragraph = read_md_as_paragraph("../app/md/texto_2_relacion_dependencia.md"),
           #                 dictionary = "../app/md/glosario_terminos.md",
           #                 class = "hovertext")
           # )
         # ),
         nombre = div(),
           # textInput(inputId = "nombre",
           #                  label = "¿Como te llamas?",
           #                  value = "Winston Smith",
           #                  placeholder = "Ingresa tu nombre y apellido"),
         provincia = div(),
           # selectInput(inputId = "residencia",
           #                       label = "¿Donde vives?",
           #                       choices = c("Ecuador","Extranjero"),
           #                       selected = "Ecuador"),
         edad = div(),
           # numericInput(inputId = "edad",
           #                   label = "¿Cuantos años tienes?",
           #                   value = 20,
           #                   min = 18,
           #                   max = 99,
           #                   step = 1),
         genero = div(),
           # selectInput(inputId = "genero",
           #                    label = "¿Con que genero te identificas?",
           #                    choices = c("Masculino","Femenino","Otro")),
         income_gastos = div(),
         tax_cuota = div(),
         total_tax = div(),
         proporciones = div(),
         obligaciones = div(),
         blank_2 = div(),
         blank_1 = div(),
         blank_3 = div(),
         blank_4 = div(),
         blank_5 = div(),
         blank_6 = div()
         )
    # ,
    # gt_output("iris_example"),
    # HTML(hover_paragraph(paragraph = "las $suces_ind son no $obligados",
    #                      dictionary = "../app/md/glosario_terminos.md",
    #                      class = "hovertext")),
    # gt_output("franja"),
    # verbatimTextOutput("checkbox"),
    # # verbatimTextOutput("select"),
    # verbatimTextOutput("text")
  )
