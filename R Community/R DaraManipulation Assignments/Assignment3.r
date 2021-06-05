dept<-data.frame(Dept_Id = c(1:3), Dept_Name = c("csc","me","ece")) #dept data frame
emp<-data.frame(Emp_Id = c(1:6), Emp_Name = c("a","b","c","d","e","f"),Dept_Id = c(1,1,3,1,1,3)) #emp data frame
sqldf("select * from emp inner join dept on emp.Dept_Id = dept.Dept_Id ")#inner join
sqldf("select * from emp left outer join dept on emp.Dept_Id = dept.Dept_Id ")#inner join
