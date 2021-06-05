func_num=function(x){
  num<-c(0,1,2,3,4,5,6,7,8,9)
  datalist<-list(10)
  a<-as.numeric(unlist(strsplit(as.character(x),"")))
  return(num[which(is.na(match(num,a)))])
}
