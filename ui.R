library(shiny)
nse_Names<-list("NSE/ACC","NSE/AMBUJACEM","NSE/ASIANPAINT","NSE/AXISBANK","NSE/BAJAJ_AUTO","NSE/BANKBARODA","NSE/BHARTIARTL","NSE/BHEL","NSE/BPCL","NSE/CAIRN","NSE/CIPLA","NSE/COALINDIA","NSE/DLF","NSE/DRREDDY","NSE/GAIL","NSE/GRASIM","NSE/HCLTECH","NSE/HDFC","NSE/HDFCBANK","NSE/HEROMOTOCO","NSE/HINDALCO","NSE/HINDUNILVR","NSE/ICICIBANK","NSE/IDFC","NSE/INDUSINDBK","NSE/INFY","NSE/ITC","NSE/JINDALSTEL","NSE/KOTAKBANK","NSE/LT","NSE/LUPIN","NSE/MM","NSE/MARUTI","NSE/NMDC","NSE/NTPC","NSE/ONGC","NSE/PNB","NSE/POWERGRID","NSE/RELIANCE","NSE/SBIN","NSE/SSLT","NSE/SUNPHARMA","NSE/TATAMOTORS","NSE/TATAPOWER","NSE/TATASTEEL","NSE/TCS","NSE/TECHM","NSE/ULTRACEMCO","NSE/WIPRO","NSE/ZEEL")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Choose Your Stocks!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("Stock_1","Stock 1: ",nse_Names),
      
      
      sliderInput("months",
                  "Time Period (in months):",
                  min = 1,
                  max = 24,
                  value = 12),
      
      checkboxGroupInput("checkGroup", 
                          label = h6("Technical Analysis Indicators"), 
                          choices = list("ADX" = 1,"ATR"=2, "BBands"=3,"CCI"=4, "CMF"=5, 
                          "CMO" = 6, "DEMA" =7, "DPO"=8,"EMA"=9,"Envelope"=10,"EVWMA"=11,
                          "MACD"=12,"Momentum"=13,"ROC"=14,"RSI"=15,"SAR"=16,"SMA"=17,
                          "SMI"=18,"Volume"=20,"WMA"=21,"WPR"=22,"ZLEMA"=23
                          ),
                          selected = 20)
    ),
  mainPanel(
      verbatimTextOutput("value"),
      plotOutput("distPlot")
    )
  )
))
