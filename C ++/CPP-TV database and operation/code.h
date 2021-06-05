
#include <iostream>
using namespace std;

/* class television is created having 
   data members: model_number, screen_size in inches, price in dollars
	 member functions: overloaded insertion and extraction operators
*/
class television
{
	int model_number;
	float screen_size;
	float price;

	public:
	friend ostream &operator<<(ostream &stream, television obj);
	friend istream &operator>>(istream &stream, television &obj);
};

istream &operator>>(istream &stream, television &obj)
{
/* User enters data */
	cout<<"Enter model number: ";
	stream>>obj.model_number;
	cout<<"Enter screen_size: ";
	stream>>obj.screen_size;
	cout<<"Enter price: ";
	stream>>obj.price;
	cout<<endl;

/* It is checked whether the entered data is satisfying some required
   conditions as per the question. 
	 If all the conditions are satisfied, then no action is taken. 
	 If any one of the conditions is not satisfied, an integer is thrown. 
*/
	try
	{
		if((obj.screen_size<12 || obj.screen_size>70) ||
			 (obj.price<0 || obj.price>5000) ||
			 (obj.model_number>9999))
			 throw 5;
	}
	catch(int i)
	{
		obj.model_number=0;
		obj.screen_size=0;
		obj.price=0;
	}
}

ostream &operator<<(ostream &stream, television obj)
{
/* The data members are displayed on the screen */
	stream<<"Model number is "<<obj.model_number<<endl;
	stream<<"Screen size is "<<obj.screen_size<<endl;
	stream<<"Price is "<<obj.price<<endl;
}

int main()
{
	television tv;
	cout<<"Enter television details: "<<endl;
	cin>>tv;
	cout<<tv;
	return 0;
}

