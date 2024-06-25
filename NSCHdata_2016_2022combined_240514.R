NSCH <- haven::read_dta("NSCHdata_2016_2022combined_240514.dta")
library(data.table)
only19.20 <- data.table(NSCH)[year %in% 2019:2020]
nrow(only19.20)

grep("year", names(NSCH), value=TRUE)
table(NSCH$year)
##  2016  2017  2018  2019  2020  2021  2022 
## 50212 21599 30530 58866 42777 50892 54103

## 29433*2 = 58866 ? why does new 2019 count above not match my old 2019 count below?

## vs my R script. raw is nrow in dta.
##     year data.type  nrow  ncol questions  %Autism %rowsNA  %colsNA
## 1:  2019       raw 29433   443       443 2.961548     100 90.06772
## 3:  2020       raw 42777   443       443 2.975757     100 90.06772

grep("autism_", names(NSCH), value=TRUE)
table(NSCH$autism_16, useNA='always')
##     1      2      3     95   <NA> 
## 41803     87   1131   6929 259029

## 2 or 3 => Autism, 1 => Not.

## is NA same as "." ?

## All the 95 values mean that the person
## was not asked the question (was ineligible/skipped). I recoded the 99
## values, which are true missing (person did not answer) to a "." value.

grep("asdage_", names(NSCH), value=TRUE)
table(NSCH$asdage_21, useNA='always')
##   1      2      3      4   <NA> 
## 334    599    437  40464 267145

## 1 or 2 => early, 3 or 4 is late.

grep("asdbehtreat_", names(NSCH), value=TRUE)
table(NSCH$asdbehtreat_16,useNA='always')
##   1      2      3     95   <NA> 
## 696    426  41890   6929 259038

## which is yes?

## I'm interested in how ML might be used with the autism_16, 17, 18, 19,
## 20, 21, 22 variables as an output (2 and 3 values indicate the child
## ever had or currently has autism), asdage_16,17,18,19,20,21,222 as an
## output including dichotomizing to be < 3 (early dx) versus 3 or older,
## and asdbehtreat_16,17,18,19,20,21,22 (yes) as an output. Perhaps we
## can discuss more in June! Olivia

