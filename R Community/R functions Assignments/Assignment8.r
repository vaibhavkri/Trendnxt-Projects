func_pos = function(x) {
  inp_char <- as.data.frame(strsplit(x, ""))
  len <- nchar(x)
  data_lis <- list(len)
  for (i in 1:len) {
    a <- which(inp_char[i, 1] == letters)
    data_lis[[i]] <- a
    i <- i + 1
  }
  return(as.numeric(data_lis))
}
