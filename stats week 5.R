#week 5 stats
#Model checking
library(tidyverse)
library(modelr)
library(car)
library(qqplotr)
library(praise)
library(patchwork)
library(stargazer)
library(skimr)

mammals <- read_csv("data/mammals.csv")

skim(mammals)#missing values
names(mammals)#all same names
unique(mammals$species)#names only appear once so all correct 
str(mammals)# 1 character which is species rest are numeric 
head(mammals)# clean data 


#inspect stats using ggally

mammals %>% 
  select(!species) %>% 
  GGally::ggpairs()

#Explore a relationship: Gestation and adult body weight
#We will expore the relationship between the length of gestation and adult bodyweight. With the working hypothesis that the length of gestation is a reliable predictor of adult bodyweight across species.


p <- mammals %>% 
  ggplot(aes(x=gestation, y=body_wt))+
  geom_point()+
  ggtitle("Gestation (days) against \n Body Weight (kg)")

p

#Does it look like a linear relationship makes sense?

#Do we have any concerns about modeling a linear relationship?
  
#Any outliers?
  
#Any initial thoughts on homoscedasticity (equal variance of the residuals across the model?)

#Linear relationship: Maybe, though it is difficult to see because of the very narrow distribution of bodyweights across the mammals

#Modeling concerns, definitely - it would be difficult to fit a good least squares line through this data

#Clearly two very large outliers on both gestation and body weight at the high end of the scale

#Also clearly a funnel shape as the values increase, so major concerns there will be heteroscedasticity (unequal residual variance across the fit of our regression).

