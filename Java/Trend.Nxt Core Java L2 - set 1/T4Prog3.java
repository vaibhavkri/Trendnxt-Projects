/*
Assignment 3:
Create a java class to create a list of string objects
i.
ii.
iii.
Count no.strings whose length is> 5
Count no.of empty strings
Find out empty strings & store them into new list by using Steam API
*/

import java.util.Arrays;
import java.util.ArrayList;

class MyStream 
{ 
    public static void main(String args[]) 
    { 
	String[] sta={"one","two","Three","4","five","VI","7","","Ten","eleven","Twelve"," "};

   	int c1= (int) Arrays.stream(sta)
		.filter(str->str.length()>5)
		.count();

	int c2= (int) Arrays.stream(sta)
		.filter(str->str.trim().equals(""))
		.count();

	ArrayList<String> emptySta = new ArrayList<>();

	Arrays.stream(sta)
	.filter(str->str.trim().equals(""))
	.forEach(str ->emptySta.add(str));

	System.out.println("Primary List of strings: ");

	for(int i=0;i<sta.length; i++)
		System.out.println(i+":-"+sta[i]);

	System.out.println("\nNo.strings whose length is >5 : " + c1);
	System.out.println("No.of empty strings: " + c2);

	
	System.out.println("\nList of empty strings: ");

	for(int i=0;i<emptySta.size(); i++)
		System.out.println(i+":-"+emptySta.get(i));
    } 
} 
