## These comments have been inserted by Mark Nelson @ nelson.mark1990@gmail.com

## There are two functions in this R File, makeCacheMatrix and cacheSolve

## function 1 : makeCacheMatrix
## This function defines an empty matrix "x" which is set to work for 2 X 2 matrix
## The Set Sub Function takes 4 numbers as input and converts it to a 2 X 2 square matrix
## The get function allows the users to be able to see the converted matrix
## The setinv function sets the inverse of this matrix using the solve function which is built-in into R
## The getinv functions outputs the inverted matrix
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- matrix(y,2,2)
      m <<- NULL
    }

   get <- function() x
   setinv <- function(solve) m <<- solve
   getinv <- function() m
   list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)

}



## Function 2: cacheSolve
## This function first checks to see if the inverted mstrix is already stored as cache in variable "m"
## If the value is present then it displays the value and comment instead of recomputing the inverse again
## If the value is missing, then it actually calucluates the inverse of the matrix and displays it
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  answer <- x$get()
  m <- solve(answer)
  x$setinv(m)
  m
  
}

## You can run the following commands to Cross Check the Answer:
## a <- makeCacheMatrix()
## a$set(c(1,2,3,4))
## a$get()
##                        Output:
##                         a$get()
##                       [,1] [,2]
##                  [1,]    1    3
##                  [2,]    2    4

## Running the Solution

##                  Output - First time 
##                  cacheSolve(a)
##                       [,1] [,2]
##                  [1,]   -2  1.5
##                  [2,]    1 -0.5


##                  Output - Second time 
##                  cacheSolve(a)
##                  getting cached data
##                       [,1] [,2]
##                  [1,]   -2  1.5
##                  [2,]    1 -0.5



