#############A. SETUP#################################################################################################################################
#Blank R Studio in the projector, keep script only visible to instructor as a guide. The goal is for students to work along and engage often
#Confirm everyone has a working version of R + RStudio + Internet connection + materials
#Here is an intro speech to fill the void while people set up everything:

#1.  We learned statistics is important. This is data analysis, data analysis takes patience to master as it
#involves learning how to engage with computers effectively so they do exactly what we want them to do
#takes time and patience to master. For this reason, learning data analysis is often described as learning
#a completely new language.

#2. Why use R?
#. It's free
#. Everyone uses it (at least all the cool kids)
#. Need more? Good graphics engine
#. Open source means there is a big community of developers creating or implementing new tools (many from within polisci)
#. A lot of manuals and tutorials can be found online, for free
#. Flexibility to import and work with almost any kind of data format
#. Learning R first makes it easier to understand other statistical software (SPSS, STATA) or useful programming tools (Python)

#3. Work along with me, if you get stuck, let me know right away. 
#Chances are that you are making a very common yet non-obvious mistake, we can all learn from that.

#4. Disclaimer: People in different disciplines have different names for the same elements (e.g. variable in social sciences = attribute in CS).
#Some of the distinctions are not helpful (a lot of different things are called objects!). I often give different names to emphasize that things
#are different, but this may not be official jargon
################################################################################################################################################

##############B. RSTUDIO##########################################################################################################################
#Optional, but strongly recommended. Essential for reproducible research

#Why use RStudio?
#1. More intuitive UI than base R
#2. Auto-complete known functions, arguments, and objects
#3. Integrated typesetting and analysis (knitr, Rmarkdown)
#4. Web applications
#5. Dynamic data visualization
#6. Better understanding of what is going on

#USER INTERFACE
#1. Console: Input queries (instructions) and output results
#2. Enironment/History: Objects in current session and history of previous commands
#3. Viewer: Graphs, help, packages, etc.
#4. Editor: Take notes, typeset documents, prepare scripts. Speaking of which...
##################################################################################################################################################

#############C. SCRIPTS#########################################################################################################################
#Scripts are simply text documents that serve as a guideline while working with R. It is impossible to memorize any line of code you write
#Scripts are important for transparency. Later today you will learn how to do nest your analysis within
#your papers so your research is reproducible in a single document. 
#People often prioritize transparency/reproducibility and forget about the importance of TRACTABILITY and MODULARIZATION
#Use scripts as a guideline to trace your previous steps,
#to motivate your decisions about data analysis and as a master back up for changes. 
#SCRIPTS ARE IMPORTANT! USE AND ABUSE THEM! Read Jake's article in the Political Methodoloist and RCP for more.

#Open new script:
#File > New file > R script [R Studio, also Ctrl+Shift+N in windows]
#File > New script (Base R)

#Create a new script, save it in the same folder in which you have all the materials. Let's go!
###############################################################################################################################################

#########D. GLORIFIED CALCULATOR ############################################
#R is a (not very) nice interactive calculator
#ctrl+enter sends (RUNS) a line of text from your script to the console
#Also can clik on Run
#F5 in base R

#You can also write directly in the console and press enter. I do not encourage working in that way, even if you are just playing around

5+7

20-11

4*3.21

5/100

2^9

#We can also select a block of lines (above) and Run them at the same time

#The "#" symbol/operator tells R to ignore anything after it

#9*4
9*4 #Ignore the rest

#We can do more complex arithmetic operations. R follows the standar conventions for precedence in operations

4^2-3*2

#And this can be altered with parenthesis ()

(4+3)^2
4+3^2

#Most of the time R will ignore spaces

4 + 3 ^ 2
4+3^                  2

#If an operation is too long and needs to be written in more than one line of code, it must be separated with an operation.
#This lets R know that you are not done with the current line

2+3*4+(36/6)+48-13*2+(2*3*6/9+15-27+12*3)

#R Studio is smart enough to understand that you are working in multiple lines
2+3*4+(36/6)+48-13*2+
  (2*3*6/9+15-27+12*3)
#If you force run just the first line, note the + intead of > in the console. This means R is expecting additional input before
#processing your request

2+3*4+(36/6)+48-13*2
+(2*3*6/9+15-27+12*3)

#Of course, we already have calculators... We want to use R for something else

########################E. OBJECTS AND BASIC OPERATIONS###########################################
#Use <- or = to create and object by assigning a certain value. 
#There is an eternal fight in the R community about which one is more appropriate
#Just use the one that feels more natural to you

x<-5+7

#R won't give you the result until prompted

x

y<-x-3

y

#BTW, note what happens to your working environment

ls()

#Storing objects in R uses memory.
#You will rarely use up all the memory,but it's a good strategy to keep it tidy to avoid confusion

x<-pi
x

y #still 9, start over

rm(list=ls())
x
y

x<-pi
y<-x-3

x
y

#More operations...
sqrt(100) #What is this?
#There's no square root operator in the keyboard, so R has a FUNCTION to make it work
#Functions are built-in operations, they take the input values, process them, and produce and output

log(100)
#Hold up, the logarithm of 100? What base?
#If you don't know how a function works, there's two options
args(log)
?log #or help(log)

#So by default is the natural log
log(100,base=10)
log10(100)

exp(100) #WHAT THE HELL IS THIS?

#Shortcut for scientific notation to avoid displaying long values. e+43 means "times 10 to the power of 43)

#You can nest functions
exp(log(100,base=9)) #Note how RStudio is nice and closes the parenthesis for you

#alternatively, we can use multiple assignments to work step by step
value<-100
thelog<-log(value,base=9)
theExp<-exp(thelog)

theexp #whoops! caps sensitive
theExp

#More cool functions
a<-theExp
b<--a #potential typo!
b

abs(b)

ceiling(a)
floor(a)
trunc(a)
trunc(9.99)

round(a)
round(a,digits=2)

signif(a)
signif(a,digits=2) #Use help to understand the difference!

sample(1:500)
sample(1:500,2)

#Any other basic operation you wish to know about?

###################E. VECTORS###########################################
#All of this can be easily done with a scientific calculator. The cool thing about R is working with VECTORS
#Vector: An object that contains continuous values

c(1,2,3)

c(20,14,-2)

c(1,2,3)+c(20,14,-2)

#Better with assignment

v1<-c(1,2,3)

v2<-c(20,14,-2)

v1+v2
v1-v2
v1*v2
v1/v2

v2/2 #What happened here?

long<-c(1,2,3,4,5,6)
short<-c(1,2)

long+short #vector recycling

medium<-c(1,2,3,4)

long+medium #Warning messages do not stop R from working but invite you to reconsider what you are doing
#Here R is telling that vector recycling is not perfect

#You can also write sequence of consecutive values
1:10 #integers 1 to 10

10:1 #inverted

pi:10 #why does it end in 9.14?

seq(1,10) #same, but with better control
seq(1,10,by=5)

rep(0,times=40)

rep(c(0,1,2),times=10)
rep(c(0,1,2),each=10)

###################. F. TYPES OF DATA AND VECTORS##############################
#Numeric vectors are just one type, there's many more

#Logical (TRUE/FALSE, NA), they tell you wether or not a logical condition is met

numeric<-c(0.5,55,-10,6)
numeric
logic<-numeric<1
logic
numeric>=6
numeric==6
numeric!=6

#Character

char<-c("A","B","C")
char
num<-c(1,2,3)

char+num

char=="A"

paste(char,num)

LETTERS

paste(letters,num,sep="-") #Again, recycling!

names<-c("Kristin","Josh","Lucie","Jack","James","Zach","Miles")
sample(names,1)

#I could make this take fewer steps if I write my own function
lot<-function(n){
  names<-c("Kristin","Josh","Lucie","Jack","James","Zach","Miles")
  out<-sample(names,n)
  return(out)
}

#Anyone can translate what the function is doing?

lot(1)

#There's a lot more wacky things to do with logical and character vectors, but we have more important things to cover

###################G. MATRICES AND DATA FRAMES #################################
#Both are a type of "rectangular" data. They are a lot like vectors, but have rows and columns, meaning they have dimension!
#Matrices can only contain one type of data
#Data frames contain different types of data

#Vectors do not have dimension
vect<-sample(1:20,35,replace=TRUE)
vect
dim(vect)
length(vect)
dim(vect)<-c(7,5)
vect
#This is now a matrix
mat<-vect
dim(mat)
class(mat)

#Or more straightforward
matrix(sample(1:20,35,replace=TRUE),nrow=7,ncol=5) #note the numbers are not the same

#Imagine now this a list of different types of candy the grad students have
candy<-cbind(names,mat)
brands<-c("student","snickers","m&m","jelly beans","haribo","other")

candy2<-rbind(brands,candy)
candy2

#Still, this looks weird
summary(candy2)

#matrices cannot have more than one type of data! We want to transform this into a data.frame!
candydf<-data.frame(candy2) #whoops!

candydf<-data.frame(mat)
candydf
row.names(candydf)<-names
colnames(candydf)<-brands #Whoops! x2
brands[2:6] #square brackets to select specific objects in a vector/data.frame
colnames(candydf)<-brands[2:6]
candydf
summary(candydf) #Now we are talking! Note the useful descriptive information

##########################H. WORKING WITH DATA##########################################
#Computer scientist use the term "data munging" to refer to all the necessary tasks before we can perform any kind of data analysis
#(Which they understand as the application of algorithms)
#For us, that means IMPORTING, CLEANING, TRANSFORMING, and DESCRIBING the data

#Where to get data?
#Sometimes we get lucky and data comes in formats that are already accesible from R
#For example, it could come as part of a PACKAGE
#Packages are to R what Apps are to a smartphone, they extend its utility in multiple ways. Often they also contain data

install.packages("car") #Packages are installed once, then they need to be required once for every session
library(car) #same as require()
?car #It's a book!

?Chile
Chile
head(Chile)
summary(Chile)

#SUBSETTING
#Select rows
chile1<-Chile[1:50,] #note we are also indicating to do nothing with the columns
chile1

#select columns
names(Chile)
vars<-c("sex","age","education","income","vote")

chile2<-Chile[,vars]

head(chile2)

#select rows by logical condition

summary(Chile$sex)
chileF<-Chile[Chile$sex=="F",]
summary(chileF$sex)
head(chileF)

#Delete instead of selecting columns
chile3<-Chile[,-7] 
names(Chile)
names(chile3) #column 7 was statusquo and was eliminated

#The subset function allows the same with more specificity
chile4<-subset(Chile,sex=="F" & age>=30 & age<=45,select=vars)
summary(chile4)

#You can also use the sample functions within the brackets to randomnly subset rows
chile.random<-Chile[sample(1:nrow(Chile),20,replace=F),]
nrow(Chile)
chile.random

#To recode variables the best procedure is to simply create a new colum within the dataset that meets certain criteria
Chile$statusquo
Chile$sq2<-abs(Chile$statusquo) #new variable transforms statusquo to the absolute values
summary(Chile$statusquo)
summary(Chile$sq2)
names(Chile)
head(Chile)

#For more complex stuff, I recommend the function ifelse
?ifelse
Chile$new.vote<-with(Chile,ifelse(Chile$vote=="Y",1,ifelse(Chile$vote=="N",0,NA)))
head(Chile,20)#verify
table(Chile$new.vote,Chile$vote)
?table

######################################I. REAL EXAMPLES AND VISUALIZATION#####################################
#Normally we don't get data that easily, we need outside sources!
#The easiest way to grab the data de downloaded is by having both the script and data files in the same folder, then we set that as the working directory

getwd()
#Session > Set Working Directory > To Source File Location
getwd()

#Once we have all in the same wd, .RData files can by easily loaded
load("fish.data.RData")
head(fish.data)

summary(fish.data$muslim)
tab<-table(fish.data$muslim)
tab

tab2<-table(fish.data$muslim,fish.data$opec)
tab2
row.names(tab2)<-c("Non-Muslim","Muslim")
colnames(tab2)<-c("Non-OPEC","OPEC")
tab2
addmargins(tab2)

barplot(tab2)

#Data rarely comes in .RData format, here is an example of the thinking procedure
#Look at noel.therien.txt

aid<-read.table("noel.therien.txt",header=T,sep="\t", fill=T)
aid
summary(aid)

plot(aid$leftpower,aid$aid)

plot(aid$leftpower,aid$aid,xlab="Leftist Parties' Influence",ylab = "Foreign Aid (% GDP)")

plot(aid$leftpower,aid$aid,
     xlab="Leftist Parties' Influence",ylab = "Foreign Aid (% GDP)",
     main="Political Parties and Foreign Aid")

plot(aid$leftpower,aid$aid,
     xlab="Leftist Parties' Influence",ylab = "Foreign Aid (% GDP)",
     main="Political Parties and Foreign Aid",
     sub="Source: Noel and Therien (2000)")

#Finally, yesterday you read Gibler's article about how territorial peace, and not demonstration or spillover effects, 
#explaing the geographic clustering of democracies
#Here's how you import the data the authors used from stata
install.pakages("foreign") #Just the first time ever you use it
library(foreign) #every session you use it

gibler<-read.dta("gibler.dta")
head(gibler)

#If you choose to do so, you may save to .Rdata or .csv
dir.create("export")
setwd("export")

save(aid,file="aid.RData")

write.csv(gibler,"gibler.csv")

#If time availble, show them how to troubleshoot problems