library(shiny)
library(Quandl)
library(quantmod)
library(TTR)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot

  
  Quandl.auth("RLd5s6pz9hd9ww4mQ-Pn")
  today<-Sys.Date()
  
  
  nse_Names<-c("NSE/ACC","NSE/AMBUJACEM","NSE/ASIANPAINT","NSE/AXISBANK","NSE/BAJAJ_AUTO","NSE/BANKBARODA","NSE/BHARTIARTL","NSE/BHEL","NSE/BPCL","NSE/CAIRN","NSE/CIPLA","NSE/COALINDIA","NSE/DLF","NSE/DRREDDY","NSE/GAIL","NSE/GRASIM","NSE/HCLTECH","NSE/HDFC","NSE/HDFCBANK","NSE/HEROMOTOCO","NSE/HINDALCO","NSE/HINDUNILVR","NSE/ICICIBANK","NSE/IDFC","NSE/INDUSINDBK","NSE/INFY","NSE/ITC","NSE/JINDALSTEL","NSE/KOTAKBANK","NSE/LT","NSE/LUPIN","NSE/MM","NSE/MARUTI","NSE/NMDC","NSE/NTPC","NSE/ONGC","NSE/PNB","NSE/POWERGRID","NSE/RELIANCE","NSE/SBIN","NSE/SSLT","NSE/SUNPHARMA","NSE/TATAMOTORS","NSE/TATAPOWER","NSE/TATASTEEL","NSE/TCS","NSE/TECHM","NSE/ULTRACEMCO","NSE/WIPRO","NSE/ZEEL")
  
   output$distPlot <- renderPlot({
     months<-as.yearmon(today)-input$months/12    
     nse_Data<-Quandl(input$Stock_1,type="xts",start_date=months,end_date=today,collapse='daily')  
     
     colnames(nse_Data)[which(colnames(nse_Data)=='Total Trade Quantity')]='Volume'
  
     techTrend<-as.numeric(input$checkGroup)
     technames<-""
     
     #reChart(name=input$c[3])
     for ( i in 1:length(techTrend)){
       if(techTrend[i]==1) technames=paste(technames,"addADX();")
       if(techTrend[i]==2) technames=paste(technames,"addATR();")
       if(techTrend[i]==3) technames=paste(technames, "addBBands();")
       if(techTrend[i]==4) technames=paste(technames,"addCCI();")
       if(techTrend[i]==5) technames=paste(technames,"addCMF();")
       if(techTrend[i]==6) technames=paste(technames,"addCMO();")
       if(techTrend[i]==7) technames=paste(technames,"addDEMA();")
       if(techTrend[i]==8) technames=paste(technames,"addDPO();")
       if(techTrend[i]==9) technames=paste(technames,"addEMA();")
       if(techTrend[i]==10) technames=paste(technames,"addEnvelope();")
       if(techTrend[i]==11) technames=paste(technames,"addEVWMA();")
       if(techTrend[i]==12) technames=paste(technames,"addMACD();")
       if(techTrend[i]==13) technames=paste(technames,"addMomentum();")
       if(techTrend[i]==14) technames=paste(technames,"addROC();")
       if(techTrend[i]==15) technames=paste(technames,"addRSI();")
       if(techTrend[i]==16) technames=paste(technames,"addSAR();")
       if(techTrend[i]==17) technames=paste(technames,"addSMA();")
       if(techTrend[i]==18) technames=paste(technames,"addSMI();")
       #if(techTrend[i]==19) technames=paste(technames,"addTRIX();")
       if(techTrend[i]==20) technames=paste(technames,"addVo();")
       if(techTrend[i]==21) technames=paste(technames,"addWMA();")
       if(techTrend[i]==22) technames=paste(technames,"addWPR();")
       if(techTrend[i]==23) technames=paste(technames,"addZLEMA();")
       
     }
     
     chartSeries(nse_Data,type='candlesticks',multi.col=TRUE,theme='white',name="",TA=technames)
     
  })

  output$value <- renderText({
    input$Stock_1
    #input$checkGroup
  })
  
})
