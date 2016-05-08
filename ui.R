library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Loan Monthly Payment (EMI) and Total Interest Calculator"),
    
    sidebarPanel(
      
      numericInput('P', 'Amount Borrowed (Principal)', 1000, min = 100),
      helpText("Please enter the Loan Amount you intend to borrow/already borrowed"),
      
      numericInput('R', 'Rate of Interest (in %)', 5, min = 0.01, max = 100, step = 0.01),
      helpText("In this field, you have to enter the Interest as charged by your bank. The buttons increase/decrease the rate by 0.01% per click. You can also enter the figure manually."),
      
      numericInput('Y', 'Term of the loan - years', 5, min = 1, max = 100, step = 1),
      helpText("Please enter the number of WHOLE years for which you will avail the loan. If there are MONTHS in addition, enter them BELOW."),
      
      numericInput('M', 'Term of the loan - months', 0, min = 0, max = 12, step = 1),
      helpText("This is the number of months IN ADDITION to the NUMBER of YEARS above. Example: 5 years AND 6 months. Enter the '6 months' here"),
      
      submitButton('Submit')
    ),
    
    mainPanel(
      h3("Results of Calculation"),
      h5("Please Press the 'Submit' button after entering all the values"),
      h4("The EMI of your Loan is:"),
      verbatimTextOutput("EMI"),
      h4("The Total Interest paid by you to the bank during the loan period is:"),
      verbatimTextOutput("Interest")
    )
  )
        
)