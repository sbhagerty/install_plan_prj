function(input, output, session) {
  
  output$intro <- renderText({
    paste("Hello", input$wb_servers)
  })
  
  
  user_checklist <- reactive({
    customer_conditions <- list_conditions(
      input$wb_servers, 
      input$connect_servers, 
      input$pm_servers, 
      input$os, 
      input$auth
    )
    
    customer_checklist_df <- checklist_df |> 
      build_checklist(customer_conditions) |> 
      filter_table()
    
    return(customer_checklist_df)
    
  })
  
  
  output$table <- render_gt(
    expr = format_table(
      user_checklist()
    )
  )
  

  output$report <- downloadHandler(
    filename = "Posit_Customer_Checklist.pdf",
    content = function(file) {
      
      quarto::quarto_render(
        "report_template.qmd",
        execute_params = list(
          wb_servers = input$wb_servers,
          connect_servers = input$connect_servers,
          pm_servers = input$pm_servers,
          os = input$os,
          auth = input$auth
        )
      )
      
      file.copy("Posit_Customer_Checklist.pdf", file)
      
    }
  )
}

