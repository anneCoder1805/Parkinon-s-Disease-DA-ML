library(ggplot2)
library(lattice)
library(caret)
library(datasets)
library(RColorBrewer)
coul <- brewer.pal(5, "Set2")
aData<-read.csv('AllData.csv')
is.data.frame(aData)
ncol(aData)
nrow(aData)
str(aData)
any(is.na(aData))
x<-matrix(c(aData$dAvgFreq, aData$dMaxFreq, aData$dMinFreq, aData$dJitterP,
          aData$dAbsJitter, aData$dRAP, aData$dPPQ, aData$dDDP, aData$dShimmer,
          aData$dShimmerdB, aData$dAPQ3, aData$dAPQ5, aData$dAPQ, aData$dDDA,
          aData$dNHR, aData$dHNR, aData$dRPDE, aData$dDFA, aData$dspread1,
          aData$dspread2, aData$dD2, aData$dPPE), nrow = 195)
y<-matrix((c(aData$dStatus)))
# f<-c("Fo", "Fhi", "Flo", "JitP",
#      "AbsJit", "RAP", "PPQ", "DDP", "Shim",
#      "ShimdB", "APQ3", "APQ5", "APQ", "DDA",
#      "NHR", "HNR", "RPDE", "DFA", "s1",
#      "s2", "D2", "PPE")
f<-c("2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17",
     "19","20", "21", "22", "23", "24")
re<-c(cor(x,y))
barplot(re,names.arg=f,xlab="Attributes",ylab="Correlation with Status",col=coul,
        main="Correlation")


