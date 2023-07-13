# Posit Installation Plan

This app helps curate an installation checklist and curates documenation for a customer's specific architecture.

# Motivation

Currently, Posit's installation guides provide information on all supported architectures. These resources are also sprawled across multiple sites (e.g. docs.posit.co, support.posit.co, solutions.posit.co). This can be overwhelming and difficult to navigate for a customer that has a specific installation plan in mind. This app aims to filer and curate an installation plan for the customer's specific needs, and provide a checklist of steps for a proper installation.

# Overview

The user will input a supported architecture into the app. Once all inputs are provided, the app will generate a curated checklist for the customer. Additionally, the app uses these parameters to generate a PDF of the installation plan. This PDF is to be saved to the customer's SalesForce account and provided directly to the customer for direct consumption.

# Framework

-   R Shiny
-   Quarto
-   `renv`

# How to Use

To run the shiny app, the primary files can be found: 

- [global.R](global.R) 
- [ui.R](ui.R) 
- [server.R](server.R)

The shiny app renders the PDF using the quarto doc: [report_template.qmd](report_template.qmd)

The quarto doc is themed using files in [_extensions/](_extensions) directory. For additional details on the Posit Theme, refer to [rstudio-marketing/posit-quarto-pdf](https://github.com/rstudio-marketing/posit-quarto-pdf).

Both the shiny app and quarto files source R functions found in the [R/](R) directory.

This app uses git-backed publishing. To publish the app to connect, refer to [tools/writeManifest.R](tools/writeManifest.R) to see how the previous `manifest.json` was generated.
