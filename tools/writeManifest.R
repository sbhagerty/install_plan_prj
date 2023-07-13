rsconnect::writeManifest(
  appDir = ".", 
  appPrimaryDoc = c("global.R",
                    "ui.R",
                    "server.R"),
  appFiles = c("global.R",
               "ui.R",
               "server.R",
               "report_template.qmd",
               fs::dir_ls("R"),
               fs::dir_ls("data"),
               fs::dir_ls("_extensions")
               )
)