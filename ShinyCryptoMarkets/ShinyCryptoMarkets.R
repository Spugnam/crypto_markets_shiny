library("shinythemes")
source("/../crypto_markets.Rmd")

cat(crypto)

shinyApp(
  ui = tagList(
    #shinythemes::themeSelector(), # box to select theme
    navbarPage(
      theme = "cerulean", # doesn't work?  
      "Quentin Shiny",
      tabPanel("Navbar 1",
               sidebarPanel(
                 sliderInput("slider", "Slider input:", 1, 100, 30)
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Coin Lookup",
                            h4("Plot Title"),
                            ggvisOutput("plot1")
                   ),
                   tabPanel("Coin Market", "This panel is intentionally left blank")
                 )
               )
      ),
      tabPanel("Trading strategies", "This panel is intentionally left blank"),
      tabPanel("Correlations", "This panel is intentionally left blank")
    )
  ),
  server = function(input, output) {
    
    output$txtout <- renderText({
      paste(input$txt, input$slider, format(input$date), sep = ", ")
    })
    
    # Single Coin chart
#     vis <- reactive({
#       # Lables for axes
#       
#       seasons_r() %>%
#         ggvis(x = xvar, y = yvar) %>%
#         layer_poi
# #
#       
#     })
    
    #vis %>% bind_shiny("plot1")
    
  }
)
