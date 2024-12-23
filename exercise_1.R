# Math operations 

2+2

5-2

5*3

#numerical variable 
numberSum <- 5+4
str(numberSum)
#strings or character variables 

myName <- "Marin"
str(myName)

#logi variables 
myLogi <- TRUE # it has to be capital TRUE or FALSE
str(myLogi)

myDateVariable <- "08/02/2024"
myDateVariable <- as.Date(myDateVariable, format = "%d/%m/%Y")

myDateOnlyYear <- format(myDateVariable, "%Y")

#Vectors

##All elements in a vector must be of the same data type
myVector <- c(1,2,3,4,5)
myVector1 <- c(2,3,-5,3,-2)
str(myVector)

mySumVector <- myVector*myVector1
mySumVector

myCharVector <- c("First", "Second", "Third", "Fourth", "Fifth")
str(myCharVector)

logiVector <- c(TRUE, FALSE, TRUE, FALSE)

mySumVector[3]
names(mySumVector) <- myCharVector

mySumVector["Third"]


#Factors
#character vector
charVector <- c("Apple", "Banana", "Cherry", "Apple", "Banana")

#convert the character vector to factor


fruitFactor <- factor(charVector)
str(fruitFactor)
levels(fruitFactor)

fruitfactorReordered <- factor(fruitFactor, levels = c("Cherry", "Apple", "Banana"))
print(fruitfactorReordered)
fruitfactorReordered


#Matrix
#all variables are of the same time yet it's two-dimensional

myMtrix <- matrix(1:6, nrow = 3, ncol = 2)
str(myMtrix)
myMtrix

myMatrix1 <- matrix(1:6, nrow = 3, ncol = 2, byrow = TRUE)
myMatrix1


rownames(myMatrix1) <- c("Row1", "Row2", "Row3")
colnames(myMatrix1) <- c("Column1", "Column2")

myMatrix1

myMatrix1[1,2]

myMatrix1[, 2]

myMatrix1[3,]

#transpose matrix

transposeMatrix <- t(myMatrix1)
transposeMatrix


#Dataframes

#we could have different data types in the dataframe

students <- data.frame(
  Name = c("Simon", "Lucas", "Irma"),
  Age = c(20,21,16),
  Grade = c(4,12,7)
  
)
print(students)

#Access columns by name with $ sign

students$Name
students$Age


students[, 3]

#create a new column

students$isAdult <- students$Age >= 18

students$TestScore <- c(90, NA, 85)

#complete cases

cleanData <- students[complete.cases(students),]

#not complete cases
students[!complete.cases(students),]

cleanData2 <- na.omit(students)

library(dplyr)

summary(onlineData)
hist(onlineData$Clothing)
hist(onlineData$Health)

mean(onlineData$Health)
var(onlineData$Health)
sd(onlineData$Health)

#filter function 
onlineData %>% 
  filter (Sex == "Male")

onlineData %>% 
  filter (Sex == "Female")

onlineData %>% 
  filter (Sex == "Female") %>%
  arrange(Tech)


onlineData %>% 
  filter (Sex == "Female") %>%
  arrange(desc(Tech))

onlineData %>% 
  mutate(Clothing = Clothing * 10) 

onlineData %>% 
  mutate(newClothing = Clothing / 2)

testData <- onlineData %>% 
  mutate(newClothing = Clothing / 2)


testData %>% 
  select(newClothing)

#how to delete a column

testData <- testData %>% 
  select(-newClothing)

#summurize function 
onlineData %>% 
  filter (Sex == "Male") %>%
  summarize(avgClo = mean(Clothing), avgHeath = mean(Health), avgTech = mean(Tech), avgMisc = mean(Misc))


#group by function 

onlineData %>% 
  group_by(Sex) %>%
  summarize(avgClo = mean(Clothing), avgHeath = mean(Health), avgTech = mean(Tech), avgMisc = mean(Misc))

summary(birthLife)

library(ggplot2)

ggplot(birthLife, aes(x=Life_Exp, y=Birth_Rate)) + 
  geom_point()

ggplot(birthLife, aes(x=Life_Exp, y=Birth_Rate, color=Development)) + 
  geom_point() +
  labs(title = "My first graph")

library(gapminder)

summary(gapminder)

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color=continent, size=pop)) +
  geom_point() +
  scale_x_log10() + 
  facet_wrap(~ continent)

gapminderDenmark <- gapminder %>% 
  filter(country == "Denmark")

ggplot(gapminderDenmark, aes(x=year, y=pop)) +
  geom_line() +
  expand_limits(y=0)

library(forcats)

summary(catRed)

catRed %>%
  mutate(Race = fct_lump(Race, n=2))

oneTwoOther <- catRed %>%
  mutate(Race = fct_lump(Race, n=2))
