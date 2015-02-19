## This file implements functions need to work with matrices with cached inverse, which may come in handy
## if the inverse of the same matrix is used multiple times




## makeCacheMatrix recieves a matrix and creates a list of 4 functions, which are responsible for
## changing values of the matrix and its inverse (set-functions) or printing them (get-functions)


makeCacheMatrix <- function(x = matrix()) {
## not calculated inverse, thus set to NULL
  inv <- NULL
  
## write the matrix value using recieved data 
  
set <- function (input_matrix_val) {
    
##overwrite the matrix    
    matrix_val <<- input_matrix_val

## new matrix values, therefore new inverse, set to NULL, since not known
    
    inverse <<- NULL
  }

## print the current matrix values

  get <- function() matrix_val

## overwrite inverse with input data

  setinv <- function(input_inverse) inv <<- input_inv
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve returns the value of the inverse matrix, if it was calculated before with a comment, otherwise
## it calculates the inverse and prints it out without a comment

cacheSolve <- function(input_cmatrix_obj, ...) {
  
  ## reach the current inverse
  
  inv <- input_cmatrix_obj$getinv()
  
  ## if not NULL, as in calculated before, just print it and exit cacheSolve
  
  if(!is.null(m)) {
    message("getting cached data")
    return(inv)
  }
  
  
  ## if inverse is NULL we need to calculate it, therefore get the value of the cached matrix
  data <- input_cmatrix_obj$get()
  
  ## calculate the inverse
  inv <- solve(data, ...)
  
  ## write down new inverse
  input_cmatrix_obj$setinv(inv)
  ## print it
  inv
  
}
