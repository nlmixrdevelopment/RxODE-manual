

l <- readLines("RxODE/R/rxsolve.R")

w <- which(regexpr("@param", l) != -1)

l <- l[-seq(1, w[1] - 1)]

w <- which(regexpr("@return", l) != -1)
l <- l[seq(1, w[1] - 1)]

l <- sub("#+' *", "", l)

l <- gsub("@param *([^ ]*)", "## \\1\n`\\1`", l)

w <- which(regexpr("@inheritParams", l) != -1)

l <- l[-w]


l2 <- readLines("07-solving.Rmd")

w <- which(regexpr("below", l2) != -1)
l2 <- l2[1:w]

writeLines(c(l2, l), "07-solving.Rmd")
