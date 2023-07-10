fluidPage(

  # Application title
  titlePanel("Posit Environment Install Plan"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h4("Number of Servers per Cluster"),
      numericInput("wb_servers", label = "Workbench Servers", value = 1),
      numericInput("connect_servers", label = "Connect Servers", value = 1),
      numericInput("pm_servers", label = "Package Manager Servers", value = 1),
      h4("Environment"),
      selectInput("os",
        label = "Linux Distribution",
        choices = list(
          "RHEL 7" = "rhel7", "RHEL 8" = "rhel8", "RHEL 9" = "rhel9", "CentOS 7" = "centos7", "Ubuntu 20" = "ubuntu20",
          "Ubuntu 22" = "ubuntu22", "openSUSE 15.4" = "opensuse"
        ),
        selected = "ubuntu22"
      ),
      selectInput("auth",
        label = "Authentication",
        choices = list("SAML" = "saml", "Local" = "local", "OIDC/OAuth 2.0" = "oidc"),
        selected = "saml"
      ),
      downloadButton(outputId = "report", label = "Generate Report")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("intro"),
      gt_output(outputId = "table")
    )
  )
)
