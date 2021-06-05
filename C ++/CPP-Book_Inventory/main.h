#include<iostream>
#include<string.h>
using namespace std;

class Books
{

public:
  string author;
  string title;
  int price;
  string publisher;
  int stock;

  
   Books(){}
   Books(string author,string title,int price,string publisher,int stock)
   {
      this->author=author;
      this->title=title;
      this->price=price;
      this->publisher=publisher;
      this->stock=stock;
   }
  

   void setAuthor(string author)
   {
     this->author=author;
   }
   
   void setTitle(string title)
   {
    this->title=title;
   }
   string getTitle()
   {
     return title;
   }
   void setPrice(int price)
   {
    this->price=price;
   }
   void setPublisher(string publisher)
   {
    this->publisher=publisher;
   }
   void setStock(int stock)
   {
     this->stock=stock;
   }
   void display()
   {
     
     cout<<"Title:"<<"\t"<<title<<endl;      
     cout<<"Author:"<<"\t"<<author<<endl;
     cout<<"Publisher:"<<"\t"<<publisher<<endl;
     cout<<"Price:"<<"\t"<<price<<endl;
     
   }

   int cost()
   {
     return price * stock;
   }

};


int main()
{
Books b[100];
int i,ch,flag=0,j=0;
int cp,pr,st;
string ti,au,pub;



do
{
cout<<"********************BOOK INVENTORY***********************"<<endl;
cout<<"1.Search"<<endl;
cout<<"2.Insert"<<endl;
cout<<"3.Display"<<endl;
cout<<"4.Exit"<<endl;
cout<<"Enter your choice"<<endl;

cin>>ch;

 switch(ch)
  {

   case 1:
       cout<<"Enter book title : "<<endl;        
       cin>>ti;
       cout<<"Enter author : "<<endl;
       cin>>au;
       for(i=0;i<100;i++) 
       {
         if((b[i].title==ti)&&(b[i].author==au))  
          { 
         flag=1;
         break;     
          }
       }
       if(flag==1)
         {
           cout<<"Search successful"<<endl;
           b[i].display();
           cout<<"How many copies do u want?"<<endl;
           cin>>cp;
           if(cp<=b[i].stock)
              cout<<"Total amount to be paid:"<<"\t"<<cp*b[i].price<<endl;
           else
              cout<<"Required no of copies are not in stock"<<endl;
           flag=0;
         }

       else if(flag==0)
          cout<<"Book Not Found"<<endl;
        break;
  
      //*************************************************************************** 
    
      case 2 :
            cout<<"Enter Title:"<<endl;
            cin>>ti;
            b[j].setTitle(ti);
            cout<<"Enter author:"<<endl;
            cin>>au;
            b[j].setAuthor(au);
            cout<<"Enter Publisher Name:"<<endl;
            cin>>pub;
            b[j].setPublisher(pub);
            cout<<"Enter Price:"<<endl;
            cin>>pr;
            b[j].setPrice(pr);
            cout<<"Enter Stock:"<<endl;
            cin>>st;
            b[j].setStock(st);
            cout<<"Book inserted successfully"<<endl;
            j++;
            break;
       //****************************************************************************

       case 3 :
            if(j==0)
               cout<<"Nothing to display"<<endl;
            for(i=0;i<j;i++)
             {
                cout<<"Book no:"<<i+1<<endl;
                cout<<"Title:"<<"\t"<<b[i].title<<endl;
                cout<<"Author:"<<"\t"<<b[i].author<<endl;
                cout<<"Publisher:"<<"\t"<<b[i].publisher<<endl;
                cout<<"Price:"<<"\t"<<b[i].price<<endl;
                cout<<"**********************************"<<endl;
             }
            break;

       case 4 : 
            break;

       default :
            cout<<"You have entered a wrong choice"<<endl;
            break;
  }             


}while(ch!=4);

return 0;
}

