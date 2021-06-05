/*
Assignment 4:
Write a java program to
i.
ii.
Create an array list to store group of student
marks(99,98,97,100,92,84,80,89,90) in Student class
Create a method calculateAvg() in Student class to calculate average marks of
students by using stream api .
*/

import java.util.Arrays;
import java.util.ArrayList;
import java.util.stream.DoubleStream;

class Student 
{ 
    ArrayList<Integer> marks;
    
    Student(){

	marks=new ArrayList<>();
	marks.addAll(Arrays.asList(new Integer[]{99,98,97,100,92,84,80,89,90}));
    }
	
    double calculateAvg(){
    	
	DoubleStream ds = marks.stream().mapToDouble(e -> new Double(e));

	return ds.average().getAsDouble();
    }
	
    public static void main(String args[]) 
    { 
	Student stu=new Student();
	System.out.println("Average Marks:-"+stu.calculateAvg());
    } 
} 
