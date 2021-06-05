#include<iostream>
#include<stdlib.h>
#include<string.h>
#include<iomanip>

using namespace std;
static int cnt;
class stud
{
 public: 
 char name[20];
 int roll;
};
class s2 : public virtual stud
{
 public : char sub[10];
    int scode;
    int sem;
    char div[2];
};
class s1:virtual public stud
{
public : char addr[30];
    int pin;
};
class sdata:public s1,public s2
{
 public : int subc1;
          int im1;
          int um1;
};

int main()
{
  sdata m[100];
  char c='y',str2[10];
  int op,n,i,j,flag=0,rl,r;
  do
  {  
    cout<<"\n * * * * * * Menu  * * * * * *";
    cout<<"\n 1. Build Table \n 2. List a Table \n 3. insert new entry"; 
    cout<<"\n 4. Delete an entry \n 5. Edit an entry \n 6. Search for record \n Enter your choice :"; 
    cin>>op;
    switch(op)
     {
       case 1 : cout<<"\n building new Table";
        cout<<"\n Enter total number of Entries :";
                cin>>n;
                for(i=0;i<n;i++)
                {
         cout<<"\n Enter Name of Student :";
                cin>>m[i].name;
        cout<<"\n Enter Roll number     :";
                cin>>m[i].roll;
        cout<<"\n Enter Name of Subject :";
                cin>>m[i].sub;
        cout<<"\n Enter Subject code for Subject "<<m[i].sub<<":";
                cin>>m[i].scode;
        cout<<"\n Enter internal marks for Subject "<<m[i].sub<<":";
                cin>>m[i].im1;
        cout<<"\n Enter University exam marks for Subject "<<m[i].sub<<" :";
                cin>>m[i].um1;
        cnt++;
                 }
                break;
       case 2 : cout<<"\n Entries in Table are :";
        cout<<setw(20)<<"\n Name_of_Student"<<setw(8)<<"Roll No"<<setw(12)<<"Subject"<<setw(10)<<"Sub_code"<<setw(12)<<"Internal"<<setw(12)<<"External";    
        cout<<"\n----------------------------------------------------------------------------------------";
        for(i=0;i<cnt;i++)
        {
        
cout<<endl<<setw(10)<<m[i].name<<setw(10)<<m[i].roll<<setw(12)<<m[i].sub<<setw(10)<<m[i].scode<<setw(12)<<m[i].im1<<setw(12)<<m[i].um1;        
        }
        break;
    case 3:j=cnt;
        cout<<"\n Enter Name of Student :";
                cin>>m[j].name;
        cout<<"\n Enter Roll number     :";
                cin>>m[j].roll;
        cout<<"\n Enter Name of Subject :";
                cin>>m[j].sub;
        cout<<"\n Enter Subject code for Subject "<<m[j].sub<<":";
                cin>>m[j].scode;
        cout<<"\n Enter internal marks for Subject "<<m[j].sub<<":";
                cin>>m[j].im1;
        cout<<"\n Enter University exam marks for Subject "<<m[j].sub<<" :";
                cin>>m[j].um1;
        cnt++;
                 break;
     case 4: cout<<"\n Enter record number to delete :";
            cin>>r;
        if(r>0 && r<=cnt) 
        {
        j=r-1;
        for(i=j;i<cnt-1;i++)
        {
        m[i]=m[i+1];
          } 
        cnt--;
        cout<<"\n Record Deleted Successfully ";        
        }
        else
            cout<<"\n Entered wrong record number,please enter correct record number \n";    
        break;

    case 5: cout<<"\n Enter record number to edit :";
            cin>>r;
        if(r>0 && r<=cnt) {
        j=r-1;
        cout<<"\n Select Field to Edit : 1. Name \n 2. Roll Number \n 3. Subject Name \n4.Subject code \n5. Internal Marks  \n6. Universirt Exam marks  \n Choice : ";
        cin>>op;
        switch(op)
        {
        case 1 : cout<<"\n Enter New Name of student :";
        cin>>m[j].name;
        break;    

        case 2 : cout<<"\n Enter updated Roll Number of student :";
        cin>>m[j].roll;
        break;
        case 3 :cout<<"\n Enter New Name of Subject :";
                cin>>m[j].sub;
        break;
        
        case 4 : cout<<"\n Enter updated Subject code for Subject "<<m[j].sub<<":";
                cin>>m[j].scode;
        break;
        case 5 : cout<<"\n Enter updated internal marks for Subject "<<m[j].sub<<":";
                cin>>m[j].im1;
        break;
        
        case 6 : cout<<"\n Enter Updated University exam marks for Subject "<<m[j].sub<<" :";
                cin>>m[j].um1;    
        break;        
           }
        }
        else
        cout<<"\n Entered wrong record number,please enter correct record number \n";
        break;
    case 6: cout<<"\n Select data type to search :\n 1. Name \n 2.Roll Number \n Choice :";
        cin>>op;
        switch(op)
        {
        case 1:cout<<"\n Enter Name to search in table :";
            cin>>str2;
            flag=0;
            for(i=0;i<cnt;i++)
            {
            if(strcmp(m[i].name,str2)==0)
            {
              flag=1;
              cout<<"\nRecord found for name "<<str2<<". Details are : ";
              cout<<"\n Name    :"<<str2<<"\t Roll :"<<m[i].roll;
              cout<<"\n Subject :"<<m[i].sub<<"\t Subject Code :"<<m[i].scode;    
               cout<<"\n Internal:"<<m[i].im1<<"\t External :"<<m[i].um1;
              }
            else 
                continue;
            }
            if(flag==0)
                cout<<"\n No record found";        
            break;
        case 2 : cout<<"\n Enter roll number to search in table :";
            cin>>rl;
            flag=0;
            for(i=0;i<cnt;i++)
            {
            if(m[i].roll==rl)
            {
              flag=1;
              cout<<"\nRecord found for Roll number "<<rl<<". Details are : ";
              cout<<"\n Name    :"<<m[i].name<<"\t Roll :"<<rl;
              cout<<"\n Subject :"<<m[i].sub<<"\t Subject Code :"<<m[i].scode;    
               cout<<"\n Internal:"<<m[i].im1<<"\t External :"<<m[i].um1;
              }
            else 
                continue;
            }
            if(flag==0)
                cout<<"\n No record found";
        }
        break;
      }
   cout<<"\n Do you want to continue (y/n) ? : ";
   cin>>c;
  } while(c=='y'||c=='Y');
}
