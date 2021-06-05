/*
Assignment 1:
Write a program to calculate the number of objects created at a given point using user defined
class.
*/

class Obj
{
    static int NoOfObj=0;

    public Obj()
    {
        NoOfObj++;
    }

    static void PrintNoOfObj()
    {
        System.out.println("No Of Objects Created:= "+NoOfObj);
    }


    public static void main(String[] as)
    {
        for(int i=0;i<10;i++){
            new Obj();
        }

        PrintNoOfObj();
    }
}
