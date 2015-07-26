## The purpose of the two functions makeCacheMatrix and cacheSolve
## is to created a cached matrix object that holds the inverse of
## a matrix. This allows for the computation to be done just once
## instead of computing repeatedly as needed.

## This first function creates the matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL      ## Create a variable with a value of null; this will be replaced later
  ## Create the set function, which sets the value of the matrix with the argument entered in y
  set <- function(y) {
    ## Use the <<- operator to set the value of x outside of the current environment
    x <<- y                 
    ## Use the <<- operator to set the value of m outside of the current environment
    m <<- NULL
  }
  ## Create the get function, which retrieves the value of x
  get <- function() x
  ## Create the setmatrix function, which uses the solve function to return the
  ## inverse of the matrix; solve returns the inverse if the b argument is missing.
  setmatrix <- function(solve) m <<- solve
  ## Create the getmatrix function, which retrieves the value of m
  getmatrix <- function() m
  ## Create our list of functions and their corresponding names
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}


## This second function computes the inverse of the matrix from makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
