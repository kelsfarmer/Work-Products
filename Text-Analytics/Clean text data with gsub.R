#procedures to conduct exploratory text analysisand clean text data from a CSV file

#import text for analysis
text<- read.csv("/text.csv")

colnames(text) #provides names of data columns

library(reshape)
cast(text, col1 ~ col2, length)

bad<- is.na(text) #creates a new object that will hold missing data
text[bad] #returns all missing elements
text[!bad] #returns all good data elements

library(grep) #text analytics and cleaning tool that searches and replaces user specified text and patterns of text
#gsub is a function of the grep package that searches through text and replaces content gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#that matches a search.  gsub subsititutes puncuation, but it must be surrounded by []
text$col<- gsub('[[:punct:]]', ' ', text$col) #transforms all punctuation into blank space
text$col<- gsub('[[:cntrl:]]', ' ', text$col) #transforms all character classes that do not give an output (backspaces, tabs, indents) with blank space
text$col<- gsub('\\d+', ' ',text$col) #transforms numerical values into digits of one or greater into a space




