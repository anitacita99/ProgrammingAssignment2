## Tests the cachematrix functionality
source('cachematrix.R')

## variables for tests
## 3x3 matrix and inverse
a <- c(1,3,3)
b <- c(1,4,3)
c <- c(1,3,4)
matrix3x3 <- rbind(a,b,c)
matrix3x3inverse <- solve(matrix3x3)

## 2x2 matrix and inverse
d <- c(4,7)
e <- c(2,6)
matrix2x2 <- rbind(d,e)
matrix2x2inverse <- solve(matrix2x2)

## tests
## test with no parameters
cachedmatrix <- makeCacheMatrix()
test_that("set and get work",expect_equivalent(cachedmatrix$get(), matrix()))
test_that("not yet cached:", expect_equivalent(cachedmatrix$getinverse(), NULL))

cacheSolve(cachedmatrix)
test_that("inv now cached:", expect_equivalent(cachedmatrix$getinverse(), matrix()))

## test with a 3x3 matrix
cachedmatrix <- makeCacheMatrix(matrix3x3)
test_that("set and get work",expect_equivalent(cachedmatrix$get(), matrix3x3))
test_that("not yet cached:", expect_equivalent(cachedmatrix$getinverse(), NULL))

cacheSolve(cachedmatrix)
test_that("3x3 inv now cached:", expect_equivalent(cachedmatrix$getinverse(), matrix3x3inverse))

## test changing to a 2x2 matrix
cachedmatrix$set(matrix2x2)
test_that("set and get work",expect_equivalent(cachedmatrix$get(), matrix2x2))
test_that("no longer cached:", expect_equivalent(cachedmatrix$getinverse(), NULL))

cacheSolve(cachedmatrix)
test_that("2x2 inv now cached:", expect_equivalent(cachedmatrix$getinverse(), matrix2x2inverse))