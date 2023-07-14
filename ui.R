page_navbar(
  title = div(
    class = "posit_logo",
    a(href = "https://posit.co/",
      img(src = "logo.png",
          title = "Posit",
          height = 30)
    )
  ),
  sidebar = sidebar(
    title = "Environment Installation Plan",
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
  
  nav_panel(
    title = "Architecture",
    card(
      card_header("Table"),
      textOutput("intro"),
      gt_output(outputId = "table")
    )
  ),
  nav_spacer(),
  # nav_item(tags$a("Posit", href = "https://posit.co")),
  # nav_item(tags$img(height = 30, src = "logo.png")),
  waiter::use_waitress()
)


