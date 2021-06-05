ST=c('NAME:Maria /COUNTRY:uruguay /EMAIL:mariaUY@gmail.com','NAME:Paul/COUNTRY:UK /EMAIL:PaulUK@gmail.com',
     'NAME:Jhon /COUNTRY:USA /EMAIL:JhonUSA@gmail.com','NAME:Carlos /COUNTRY:Spain /EMAIL:CarlosSP@gmail.com')
  
func_matrix=function(x){
  datalist_mat<-list(length(x))
  for (i in 1:length(x)) {
    datalist_mat[[i]]<-data.frame(Name=substr(x[i],6,gregexpr("/",ST[i])[[1]][1]-1), 
                                  COUNTRY=substr(x[i],gregexpr("/",ST[i])[[1]][1]+9,gregexpr("/",ST[i])[[1]][2]-2),
                                  EMAIL= substr(x[i],gregexpr("/",ST[i])[[1]][2]+7,nchar(x[i]))
                                  )
    i<i+1
  }
  return(do.call(rbind.data.frame,datalist_mat))
} 
