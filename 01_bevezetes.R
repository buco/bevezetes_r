install.packages("data.table")
install.packages("openxlsx")
install.packages("xlsx")
install.packages("jsonlite")
install.packages("httr")
install.packages("listviewer")



data.table::fread("sample.xlsx")
xlsx::read.xlsx("sample.xlsx")
openxlsx::read.xlsx("sample.xlsx")

read.csv()
read.table()
readLines()

jsonlite::fromJSON()




