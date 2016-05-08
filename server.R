library(shiny)

## The EMI calculation Function:

payment <- function(P, R, Y, M) {
  i <- R/(12*100)
  n <- (Y*12)+M
  pvf <- (1-((1+i)^(-n)))/(i)
  pmt <- P/pvf
  pmt <- round(pmt, 2)
  return(pmt)
}

## The total interest calculation function

int <- function(P, R, Y, M) {
  i <- R/(12*100)
  n <- (Y*12)+M
  pvf <- (1-((1+i)^(-n)))/(i)
  pmt <- P/pvf
  total <- pmt*n
  net <- total-P
  net <- round(net,2)
  return(net)
}

## Displaying the monthly payment and total interest:
shinyServer(
  function(input, output) {
    output$EMI <- renderPrint({
      EMI <- payment(input$P, input$R, input$Y, input$M)
      cat("The EMI is: $")
      cat(round(EMI, 2))
    })
    output$Interest <- renderPrint({
      Interest <- int(input$P, input$R, input$Y, input$M)
      cat("The total interest you paid is: $")
      cat(round(Interest, 2))
    })
  }
)