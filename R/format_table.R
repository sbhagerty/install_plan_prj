format_table <- function(data) {
  data |> 
    gt() |> 
    fmt_markdown(columns = Info) |> 
    tab_style(
      style = list(cell_text(weight = "bold", align = "center")),
      locations = cells_row_groups()
    ) |> 
    tab_options(
      column_labels.hidden = TRUE,
      stub.border.width = px(2),
      stub.border.color = "black"
    )
}