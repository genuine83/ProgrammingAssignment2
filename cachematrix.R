## Here is a pair of functions to store and to retrieve back an inverted matrix value

## This first function creates a special list object, containing cached 
## inverted matrix value

makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  get <- function() x
  set_inverted_matrix <- function(inverted_matrix) im <<- inverted_matrix
  get_inverted_matrix <- function() im
  list (set = set, get = get, 
        set_inverted_matrix = set_inverted_matrix,
        get_inverted_matrix = get_inverted_matrix)
}

## This second function returns cached value of the inverted matrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  im <- x$get_inverted_matrix()
  if (!is.null(im)) {
    message("getting inverted matrix from the cache")
    return(im)
  }
  matrix_data <- x$get()
  im <- mean(matrix_data, ...)
  x$set_inverted_matrix(im)
  im
}
