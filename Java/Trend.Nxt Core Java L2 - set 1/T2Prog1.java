/*
Assignment 1:
Write a program to Write 1) Date object 2) a Double object and 3) A Long object to file and
again reading it back from file.
*/

import java.util.Date;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;


class WriterReader
{

    public static void main(String[] as) throws Exception
    {
     	Date date=new Date();
	Double d=new Double(3.4);
	Long l =new Long(123456789);

	FileOutputStream fout = new FileOutputStream(new File("myObjects.txt"));
	ObjectOutputStream ObjOut = new ObjectOutputStream(fout);

        ObjOut.writeObject(date);
	ObjOut.writeObject(d);
	ObjOut.writeObject(l);

	ObjOut.close();
	fout.close();

	System.out.println("Objects written to file successfully");

	FileInputStream fin = new FileInputStream(new File("myObjects.txt"));
	ObjectInputStream ObjIn = new ObjectInputStream(fin);

	Date date1 = (Date) ObjIn.readObject();
	Double d1 = (Double) ObjIn.readObject();
	Long l1 = (Long) ObjIn.readObject();

	System.out.println("Objects Read:");
	System.out.println(date1.toString()+"\n"+d1.toString()+"\n"+l1.toString());

	ObjIn.close();
	fin.close();
    }
}
