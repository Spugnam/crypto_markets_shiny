library(DT)
library(shiny)
library(googleVis)

shinyServer(function(input, output){
    # show map using googleVis
    # output$map <- renderGvis({
    #     gvisGeoChart(state_stat, "state.name", input$selected,
    #                  options=list(region="US", displayMode="regions", 
    #                               resolution="provinces",
    #                               width="auto", height="auto"))
    # })
    
    # show histogram using googleVis
    output$hist <- renderGvis({
      #print(input$selected)
      #gvisHistogram(data=log(as.data.frame(crypto[,input$selected, drop=FALSE]+1))) # price histogram
      gvisLineChart(data = crypto[crypto$symbol=="BTC",], 
                    xvar = "date", 
                    yvar ="close",
                    options=list(title = "Bitcoin price 2014-2017",
                                 vAxes="[{title:'BTC close'}]",
                                 legend="none"))
    })
    
    output$graph <- renderGvis({
      #gvisLineChart(crypto) 
      gvisLineChart(crypto_active[,c(1,2,3)],
                    options=list(title = "Coins initiations on CoinMarketCap.com 2014-2017",
                                 legend="top",
                                 series="{0: { labelInLegend: 'Total active coins' },
                                 1: { labelInLegend: 'Monthly coins initiations' },
                                 }" )) # initiations/ active coins
    })
    
    # show data using DataTable
    output$table <- DT::renderDataTable({
      datatable(crypto, rownames=FALSE) 
      #%>% formatStyle(input$selected, background="skyblue", fontWeight='bold')
    })
    
    # show statistics using infoBox
    # output$maxBox <- renderInfoBox({
    #     max_value <- max(state_stat[,input$selected])
    #     max_state <- 
    #         state_stat$state.name[state_stat[,input$selected] == max_value]
    #     infoBox(max_state, max_value, icon = icon("hand-o-up"))
    # })
    # output$minBox <- renderInfoBox({
    #     min_value <- min(state_stat[,input$selected])
    #     min_state <- 
    #         state_stat$state.name[state_stat[,input$selected] == min_value]
    #     infoBox(min_state, min_value, icon = icon("hand-o-down"))
    # })
    # output$avgBox <- renderInfoBox(
    #     infoBox(paste("AVG.", input$selected),
    #             mean(state_stat[,input$selected]), 
    #             icon = icon("calculator"), fill = TRUE))
})