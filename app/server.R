server <- 
  function(input, output, session){
    
    output$iris_example <- render_gt(
      iris_tibble %>% 
        rownames_to_column() %>% 
        rowwise() %>% 
        mutate(
          rowname = as.numeric(rowname),
          nombre = map(rowname, .f = ~textinput_gt(.x,"_textinput", label = paste("My text label", .x))),
          ingreso = map(rowname, .f = ~numericinput_gt(.x, "_numeric",label = "Income",value = 500)),
          #                                             label = paste("Income", .x))),
          tipo_ingreso = map(rowname,.f = ~selectinput_gt(.x, "_tipo", label = paste("Origen ingresos", .x),
                                                          choices = c("Herencias","Actividades"),
                                                          selected = "Actividades"))
        ) %>% 
        gt()
    )
    
    output$checkbox <- renderText({
      
      # names(input)
      
      
      
      map_dbl(
        .x = 1:nrow(iris_tibble),
        .f = ~input[[paste0(.x,"_numeric")]]
      )
    })
    
    ingresos <- reactive({
      
      # names(input)
      
      
      
      map_dbl(
        .x = 1:nrow(iris_tibble),
        .f = ~input[[paste0(.x,"_numeric")]]
      )
    })
    
    
    tabla_franjas <- reactive({
      
      res <- map_chr(
        .x = 1:nrow(iris_tibble),
        .f = ~input[[paste0(.x,"_tipo")]]
      ) %>% 
        unique()
      
      if(res == "Actividades"){
        
        franjas_pn_2020
        
      }else{
        
        franjas_hld_2020
      }
      
    })
    
    output$franja <- render_gt({
      total <- ingresos() %>% 
        reduce(sum,na.rm = T) 
      
      
      
      tabla_franjas() %>% 
        rowwise() %>% 
        mutate(
          total = total,
          indicador = if_else(between(total,
                                      `Fracción Básica`,
                                      `Exceso hasta`),
                              1,
                              NA_real_)) %>% 
        gt()
      
      
    })
    # output$select <- renderText({
    #   map_chr(
    #     .x = 1:nrow(iris_tibble),
    #     .f = ~input[[paste0(.x,"_selectinput")]]
    #   )
    # })
    
    output$text <- renderText({
      map_chr(
        .x = 1:nrow(iris_tibble),
        .f = ~input[[paste0(.x,"_textinput")]]
      )
    })
    
  }