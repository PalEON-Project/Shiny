# ui.R
library(shiny)

all_taxa <- readRDS('Data/all_taxa.RDS')

shinyUI(pageWithSidebar(


  # Application title:
  headerPanel("Settlement-era Tree Composition"),
  
  # Sidebar with dropdown choice of taxa:
  sidebarPanel(
    selectInput("taxon1", "PLSS Taxon", unique(as.character(all_taxa$taxon))),
    selectInput("taxon2", "PLSS Second Taxon", c("None", unique(as.character(all_taxa$taxon)))),
      sliderInput(inputId = "zlimit",
                  label = "Scale upper limit:",
                  min = 0.05, max = 1, value = .5, step = 0.1),
      sliderInput(inputId = "zlimit_sd",
                  label = "Scale upper limit (for uncertainty):",
                  min = 0.0, max = .25, value = .25, step = 0.05),
     checkboxInput(inputId = "continuous",
      label = strong("Continuous scale"),
      value = TRUE),
     checkboxInput(inputId = "zoom",
      label = strong("Zoom"),
      value = FALSE),
      
      conditionalPanel(condition = "input.zoom == true",
                   
    sliderInput(inputId = "xlim1",
        label = "West limit",
        min = -67000, max = 2300000, value = -67000, step = 100000),
    sliderInput(inputId = "xlim2",
        label = "East limit",
        min = -67000, max = 2300000, value = 2300000, step = 100000),
    sliderInput(inputId = "ylim2",
        label = "North limit",
         min = 62000, max = 1494000, value = 1494000, step = 100000),
     sliderInput(inputId = "ylim1",
         label = "South limit",
         min = 62000, max = 1494000, value = 62000, step = 100000)
                   
   ),
  
    width = 3), 
  mainPanel(plotOutput("MapPlot", width = "800px"), width = 9))
)
