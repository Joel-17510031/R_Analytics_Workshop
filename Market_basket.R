#Market basket analysis
library(arules)
library(arulesViz)
library(datasets)
data(Groceries)
inspect(Groceries[1:5])
LIST(Groceries[1:5])
# For market basket analysis convert data into transaction class
?transactions-class


# Apriori Algorithm
frequentItems<- eclat(Groceries, parameter=list(supp=0.005, minlen=1,maxlen=15))
frequentItems
inspect(frequentItems[1:5])
#support(A&B)= n(A&B)/N intersection of A&B by N

itemFrequencyPlot(Groceries, topN=15, type="absolute")
itemFrequencyPlot(Groceries, topN=15, type="relative")
abline(h=0.2)

rules<- arules::apriori(Groceries, parameter= list(support=0.005, confidence=0.5))
rules
inspect(rules[1:5])
redundant=which(is.redundant(rules))
rules<- rules[-redundant]
rules

# factors that influence sale of something (rhs side)
rules<- apriori(data=Groceries, parameter=list(supp=0.001,conf=0.08),appearance=(list(default="lhs",rhs="whole milk")),control=list(verbose=F))
inspect(rules[1:5])

#visualizing the rules
plot(rules[1:5], measure=c("support", "lift"), shading="confidence")

# make it interactive
plot(rules, method="graph", engine="interactive", shading="confidence")

