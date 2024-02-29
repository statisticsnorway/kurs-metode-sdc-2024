Print <- function(x, row.names = TRUE, maxrows = 100) {
  if(nrow(x)>maxrows){
    message(paste(nrow(x)-maxrows,"rows omitted below"))
    x <- x[seq_len(maxrows), ,drop=FALSE]
  } 
  Nprint <- function(x) {
    x <- as.character(x)
    x[x == "FALSE"] <- "-"
    x
  }
  if(!is.null(x$primary)) x$primary <- Nprint(x$primary) 
  if(!is.null(x$suppressed)) x$suppressed <- Nprint(x$suppressed)
  row.names(x) <- NULL
  print.data.frame(x, row.names = row.names)
}