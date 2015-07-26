## The purpose of the two functions makeCacheMatrix and cacheSolve
## is to created a cached matrix object that holds the inverse of
## a matrix. This allows for the computation to be done just once
## instead of computing repeatedly as needed.

## This first function creates the matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL      ## Create the inverse matrix, set to NULL
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
  ## Create the getmatrix function, which gets the inverse
  getmatrix <- function() m
  ## Create our list of functions and their corresponding names
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}


## This second function computes the inverse of the matrix from makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  ## First, use the getmatrix function from makeCacheMatrix and assign to m
  m <- x$getmatrix()
  ## Check to see if m is already the inverse; if it is, return m and skip the rest
  if (!is.null(m)) {
    message("Getting cached data.")
    return(m)
  }
  ## If we reach this point, it means we need to calculate the inverse
  the_matrix <- x$get()
  m <- solve(the_matrix, ...)
  x$setmatrix(m)
  return(m)
}
