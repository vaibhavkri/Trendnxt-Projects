/*
Assignment 2:
Create an ArrayList which will be able to store only numbers like int,float,double,etc, but not
any other data type.
*/

import java.util.ArrayList;
import java.util.Collection;

class MyArrayList<E> extends ArrayList<E>
{
    void ThrowException() throws NumberFormatException
    {
	throw new NumberFormatException("Not Supported Other data type except int,float and double");
    }

    @Override
    public boolean add(E e)
    {
        if(e instanceof Integer || e instanceof Float || e instanceof Double)
            return super.add(e);
        else
	    ThrowException();
        return false;
    }
    
    @Override
    public void add(int index, E e)
    {
        if(e instanceof Integer || e instanceof Float || e instanceof Double)
            super.add(index, e);
        else
            ThrowException();
    }

    @Override
    public boolean addAll(Collection<? extends E> c)
    {
	for(E e : c){
	    if(e instanceof Integer || e instanceof Float || e instanceof Double){
		ThrowException();
		return false;
	    }
        }
	return super.addAll(c);
    }

    @Override
    public boolean addAll(int index, Collection<? extends E> c)
    {
      for(E e : c){
	    if(e instanceof Integer || e instanceof Float || e instanceof Double){
		ThrowException();
		return false;
	    }
        }
	return super.addAll(index, c);
    }

    public static void main(String[] as) throws Exception
    {
        MyArrayList<Object> me=new MyArrayList<Object>();
        me.add(1);
        me.add(3.4);
        me.add(4.6f);
	me.add('4');
	me.add(3,"Sampu");
    }
}
