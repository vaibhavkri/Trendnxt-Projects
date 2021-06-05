Id=c(1:10)
Age=c(14,12,15,10,23,21,41,56,78,12)
Sex=c('F','M','M','F','M','F','M','M','F','M')
Code=letters[1:10]
df=data.frame(Id,Age,Sex,Code)  

func_code=function(x,a,b){
  prev_val<-x[a,'Code']
  x[a,'Code']<-x[b,'Code']
  x[b,'Code']<-prev_val
  
  return(x)
}

