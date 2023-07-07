function(input, output) {
  
  output$intro <- renderText({
    paste("Hello", input$wb_servers)
  })
  
  output$table <- render_gt(
    expr = format_table(
      input$wb_servers, 
      input$connect_servers, 
      input$pm_servers, 
      input$os, 
      input$auth
    )
  )
}
