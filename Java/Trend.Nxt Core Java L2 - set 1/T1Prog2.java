/*
Assignment 2:
Develop a java class that has finalize method which displays “Finalize method called”. Create
another class which creates objects of the previous class and it uses the same object reference for
creating these objects. For example, if A1 is the class name, then the objects are created as
below:
A1 a = new A1();
a = new A1();
a = new A1();
When the statement Runtime.getRuntime().gc() is invoked, how many times the finalize method
is called?


Ans:- The nubmer of calling of finalize method is not fixed. It is determined by JVM.
 
*/

class A1
{
    public A1()
    {
	System.out.println("New A1 Object Created");
    }

    @Override
    protected void finalize() throws Throwable
    {
        System.out.println("Finalize method called");
    }

}

class Test
{
    public static void main(String[] as)
    {
        A1 a = new A1();

        for(int i=0;i<10;i++){

            a = new A1();
        }

	Runtime.getRuntime().gc();
    }
}
