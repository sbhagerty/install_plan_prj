get_checklist <- function() {
  read_csv("data/install_checklist.csv",
           show_col_types = FALSE) |>
    mutate(
      Info = case_when(
        is.na(Description) & is.na(Resources) ~ paste(""),
        is.na(Resources)                      ~ paste(Description),
        is.na(Description)                    ~ paste("<b>Resources: </b>", Resources),
        TRUE                                  ~ paste(Description, "<b>Resources: </b>", Resources)
      )
    )
}