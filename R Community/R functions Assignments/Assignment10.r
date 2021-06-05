func_sort=function(x){
  num<-as.numeric(unlist(strsplit(as.character(x),"")))
  num<-sort(num)*2
  return(num)
}
