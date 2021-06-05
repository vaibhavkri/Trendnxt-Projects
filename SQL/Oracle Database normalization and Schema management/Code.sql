create table Student(S_RollNo varchar(4) NOT NULL,S_Name varchar(30) NOT NULL,S_DOB Date,S_Mobile varchar(10))

ALTER TABLE Student ADD CONSTRAINT PK_Student PRIMARY KEY(S_RollNo); 

Insert into Student (S_RollNo, S_Name, S_DOB, S_Mobile) values (001,'Aaradhiya',TO_DATE('1995-05-06','yyyy-mm-dd'),9876543210);
Insert into Student (S_RollNo, S_Name, S_DOB, S_Mobile) values (002,'Sahana',TO_DATE('1994-06-10','yyyy-mm-dd'),9765843210);
Insert into Student (S_RollNo, S_Name, S_DOB, S_Mobile) values (003,'Udhaya',TO_DATE('1994-02-19','yyyy-mm-dd'),8124079630);

select * from Student

delete from student where S_Rollno in(1,2,3)

create table Course_Details(Course_ID varchar(20) NOT NULL,Course_Name varchar(30) NOT NULL,Course_Fee varchar(10) NOT Null)

ALTER TABLE Course_Details ADD CONSTRAINT PK_Course_Details PRIMARY KEY(Course_ID);

Insert into Course_Details (Course_ID,Course_Name,Course_Fee) values (101,'Selenium',10000);
Insert into Course_Details (Course_ID,Course_Name,Course_Fee) values (102,'Tosca',15000);
Insert into Course_Details (Course_ID,Course_Name,Course_Fee) values (103,'BDD',20000);

select * from Course_Details

delete from Course_Details where Course_ID in(101,102,103)

Create table Course_Register (R_ID int Not Null, S_RollNo varchar(4) NOT NULL , Course_ID varchar(20) NOT NULL ,PRIMARY KEY (R_ID),
FOREIGN KEY (S_RollNo) REFERENCES Student (S_RollNo),FOREIGN KEY (Course_ID) REFERENCES Course_Details (Course_ID))

ALTER TABLE Course_Register 
ADD DateOfRegistration Date default sysdate;

Alter table Course_Register ADD FOREIGN KEY (Course_ID) REFERENCES Course_Details (Course_ID)

Alter table Course_Register drop column DateOfRegistration

select* from Course_Register

Insert into Course_Register (R_ID, S_RollNo, Course_ID,DateOfRegistration) values (011,1,101,sysdate);
Insert into Course_Register (R_ID, S_RollNo, Course_ID,DateOfRegistration) values (012,1,103,sysdate);
Insert into Course_Register (R_ID, S_RollNo, Course_ID,DateOfRegistration) values (013,2,102,sysdate);
Insert into Course_Register (R_ID, S_RollNo, Course_ID,DateOfRegistration) values (014,3,103,sysdate);
Insert into Course_Register (R_ID, S_RollNo, Course_ID,DateOfRegistration) values (015,3,103,sysdate);
Insert into Course_Register (R_ID, S_RollNo, Course_ID,DateOfRegistration) values (016,2,101,sysdate);

Create table Exam (Exam_ID varchar(5) NOT NULL, S_RollNo varchar(4) NOT NULL ,DateOfExam Date, Score varchar (20) NOT NULL ,PRIMARY KEY (Exam_ID),
FOREIGN KEY (S_RollNo) REFERENCES Student (S_RollNo))

Insert into Exam (Exam_ID,S_RollNo,DateOfExam,Score) values (1001,1,DATE '2018-11-10',90);
Insert into Exam (Exam_ID,S_RollNo,DateOfExam,Score) values (1002,2,DATE '2018-11-15',76);
Insert into Exam (Exam_ID,S_RollNo,DateOfExam,Score) values (1003,1,DATE'2018-03-20',82);
Insert into Exam (Exam_ID,S_RollNo,DateOfExam,Score) values (1004,3,DATE'2018-03-25',89);

select * from Exam
Select SUM(Course_Fee) AS Total_Fees from Course_Details INNER JOIN Course_Register ON Course_Details.Course_ID=Course_Register.Course_ID
Select S.S_Name,CD.Course_Name,CD.Course_Fee,Ex.Score from 
Student S ,Course_Details CD,Course_Register CR,Exam Ex where( S.S_Rollno = CR.S_Rollno) AND (CD.Course_ID=CR.Course_ID) AND (CR.S_Rollno=Ex.S_Rollno) 

Update Student SET S_Mobile = 9799814785 where S_Name='Aaradhiya';
*******************************************************************************************
Grant Create User S_Admin1 Identified BY S_Admin1;

Grant Connect to Student;

Grant Create Session Grant ANY Privilege TO Student;

Grant Unlimited Tablespace to Student;

Grant SELECT,INSERT,UPDATE,DELETE ON SCHEMA.Student
********************************************************************************************

Grant Connect to Course_Details;

Grant Create Session Grant ANY Privilege TO Course_Details;

Grant Unlimited Tablespace to Course_Details;

Grant SELECT,INSERT,UPDATE,DELETE ON SCHEMA.Course_Details;
********************************************************************************************
Grant Connect to Course_Register;

Grant Create Session Grant ANY Privilege TO Course_Register;

Grant Unlimited Tablespace to Course_Register;

Grant SELECT,INSERT,UPDATE,DELETE ON SCHEMA.Course_Register;

*******************************************************************************************
Grant Connect to Exam;

Grant Create Session Grant ANY Privilege TO Exam;

Grant Unlimited Tablespace to Exam;

Grant SELECT,INSERT,UPDATE,DELETE ON SCHEMA.Exam;
*******************************************************************************************
Create User Manager Identified BY manager1

Grant Connect to Student;

Grant Create Session Grant ANY Privilege TO Student;

Grant Unlimited Tablespace to Student;

Grant SELECT ON SCHEMA.Student;
*********************************************************************************************
Grant Connect to Course_Details;

Grant Create Session Grant ANY Privilege TO Course_Details;

Grant Unlimited Tablespace to Course_Details;

Grant SELECT ON SCHEMA.Course_Details;
***********************************************************************************************
Grant Connect to Course_Register;

Grant Create Session Grant ANY Privilege TO Course_Register;

Grant Unlimited Tablespace to Course_Register;

Grant SELECT ON SCHEMA.Course_Register;
************************************************************************************************
Grant Connect to Exam;

Grant Create Session Grant ANY Privilege TO Exam;

Grant Unlimited Tablespace to Exam;

Grant SELECT ON SCHEMA.Exam;
************************************************************************************************
Create User Clerk Identified BY clerk2

Grant Connect to Student;

Grant Create Session Grant ANY Privilege TO Student;

Grant Unlimited Tablespace to Student;

Grant SELECT,INSERT,UPDATE ON SCHEMA.Student;
**************************************************************************************************
Grant Connect to Course_Details;

Grant Create Session Grant ANY Privilege TO Course_Details;

Grant Unlimited Tablespace to Course_Details;

Grant SELECT,INSERT,UPDATE ON SCHEMA.Course_Details;
*******************************************************************************************************
Grant Connect to Course_Register;

Grant Create Session Grant ANY Privilege TO Course_Register;

Grant Unlimited Tablespace to Course_Register;

Grant SELECT,INSERT,UPDATE ON SCHEMA.Course_Register;
******************************************************************************************************
Grant Connect to Exam;

Grant Create Session Grant ANY Privilege TO Exam;

Grant Unlimited Tablespace to Exam;

Grant SELECT,INSERT,UPDATE ON SCHEMA.Exam;
 **************************************************************************************************
Create user Joker_Admin identified by Admin123;

Create user Joker_Manager identified by Manager123;
 
Create user Joker_Clerk identified by Clerk123;
 
Grant Select,Insert,Update,Delete on Student1 to JokerAdmin;

Grant Select,Insert,Update,Delete on Course_Details1 to JokerAdmin;

Grant Select,Insert,Update,Delete on Register_Course1 to JokerAdmin;

Grant Select,Insert,Update,Delete on Exam1 to JokerAdmin;
 
Grant Select,Insert,Update on Student1 to JokerManager;

Grant Select,Insert,Update on Course_Details1 to JokerManager;

Grant Select,Insert,Update on Register_Course1 to JokerManager;

Grant Select,Insert,Update on Exam1 to JokerManager;
 
Grant Select,Insert on Student1 to JokerClerk;

Grant Select,Insert on Course_Details1 to JokerClerk;

Grant Select,Insert on Register_Course1 to JokerClerk;

Grant Select,Insert on Exam1 to JokerClerk;

Grant update(TELNO) on Student1 to JokerClerk;

Commit;
