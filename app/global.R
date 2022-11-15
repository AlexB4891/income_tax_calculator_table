
# ------------------------------------------------------------------------- #
#                           Income tax calculator                           #
# ------------------------------------------------------------------------- #


# Libraries ---------------------------------------------------------------

library(shiny)
library(gt)
library(tidyverse)
library(bslib)
library(DT)
library(shiny.semantic)

# Functions ---------------------------------------------------------------

# Read MD file an transform it to inputs for a hovered text:

read_md <- function(md_file){
  
  tibble::tibble(text = readr::read_lines(md_file)) %>%
    dplyr::mutate(
      paragraph = str_detect(text,"^#+.+"),
      section = str_extract(text,"^#+.+")) %>% 
    tidyr::fill(section,.direction = "down") %>% 
    dplyr::mutate(
      tag = str_extract(section,"\\$\\S+(?=[:space:])"),
      replace = str_remove(section,pattern = str_c("\\",tag)),
      replace = str_remove(replace,"^#+"),
      replace = str_trim(replace),
      tag = str_extract(section,"\\$\\S+(?=[:space:])")) %>%
    tidyr::fill(tag,.direction = "down") 
}


# Read paragraph ----------------------------------------------------------


read_md_as_paragraph <- function(md_file){
  
  texto <- readr::read_lines(md_file)
  
  title <- str_detect(texto,"^#")
  
 modified <-  map2(
    texto,
    title,
    ~{
      
      if(.y){
        number <- str_count(.x,"#")
        
        texto <- str_remove_all(.x,"#")
        
        texto <- str_c("<h",number,">",texto,"</h",number,">")
      }else{
        texto <- .x
      }
    return(texto)
    }
  )
  
 modified %>% 
    str_c(collapse = "<br>" )
}

# Make the hover HTML syntax:

hover_paragraph <- function(paragraph,
                            dictionary = "../app/md/glosario_terminos.md",
                            class){
  
  replaces <- read_md(dictionary) %>% 
    filter(!paragraph) %>% 
    select(tag,replace,text)
  
  reemplazo <- 
    function(parafo,row){
      pmap(row,function(tag,replace,text,parafo){
        replace <- str_c('<span class="',class,'" data-hover="',text,'">',
                         str_to_sentence(replace),'</span>')
        
        parafo %>% 
          str_replace(pattern = str_c("\\",tag),replacement = replace)
      },parafo = parafo)
    }
  
  
  
  hovered_text <-   reduce(.x = replaces %>% 
                             split(.$tag),
                           .f = reemplazo,
                           .init = paragraph) %>% 
    str_c("<div>",.,"</div>")
  
  return(hovered_text)
  
}


# {gt} functions ----------------------------------------------------------

checkbox_gt <- function(value, inputid,...){
  as.character(
    shiny::checkboxInput(
      inputId = paste0(value,inputid),
      ...
    )
  ) %>% 
    gt::html()
}

selectinput_gt <- function(value, inputid,...){
  as.character(
    shiny::selectInput(
      paste0(value,inputid),
      ...
    )
  ) %>% 
    gt::html()
}

textinput_gt <- function(value, inputid, ...){
  as.character(
    shiny::textInput(
      paste0(value,inputid),
      ...
    )
  ) %>% 
    gt::html()
}

numericinput_gt <- function(row, inputid, ...){
  as.character(
    shiny::numericInput(
      paste0(row,inputid),
      ...
    )
  ) %>% 
    gt::html()
}


# Tables  -----------------------------------------------------------------

franjas_hld_2020 <- tibble(
  `Fracción Básica` = c(0,
                        72090.01,
                        144180.01,
                        288361.01,
                        432571.01,
                        576772.01,
                        720952.01,
                        865113.01),
  `Exceso hasta` = c(72090.00,
                     144180.00,
                     288361.00,
                     432571.00,
                     576772.00,
                     720952.00,
                     865113.00,
                     Inf),
  `Impuesto sobre la fracción básica` = c(NA_real_,
                                          NA_real_,
                                          3605,
                                          18023,
                                          39654,
                                          68494,
                                          104539,
                                          147787),
  `% Impuesto sobre la fracción excedente` = c(0,
                                               0.05,
                                               0.1,
                                               0.15,
                                               0.2,
                                               0.25,
                                               0.3,
                                               0.35)
)

franjas_pn_2020 <- tibble(
  `Fracción Básica` = c(0,
                        11315.01,
                        14416.01,
                        18018.01,
                        21639.01,
                        43268.01,
                        64887.01,
                        86516.01,
                        115338.01),
  `Exceso hasta` = c(11315.00,
                     14416.00,
                     18018.00,
                     21639.00,
                     43268.00,
                     64887.00,
                     86516.00,
                     115338.00,
                     Inf),
  `Impuesto sobre la fracción básica` = c(NA_real_,
                                          NA_real_,
                                          155,
                                          515,
                                          950,
                                          4194,
                                          8518,
                                          13925,
                                          22572),
  `% Impuesto sobre la fracción excedente` = c(0,
                                               0.5,
                                               0.10,
                                               0.12,
                                               0.15,
                                               0.20,
                                               0.25,
                                               0.30,
                                               0.35)
)


# Define sample data
franjas_hld_2020 <- 
  franjas_hld_2020 %>% 
  as_tibble() %>% 
  ungroup()

franjas_pn_2020 <- 
  franjas_pn_2020 %>% 
  as_tibble() %>% 
  ungroup()





iris_tibble <- tibble(persona = "Ecuador")
