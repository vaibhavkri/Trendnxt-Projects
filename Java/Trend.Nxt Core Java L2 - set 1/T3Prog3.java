/*
Assignment 3:
Write a program which copies the content of one file to a new file by removing unnecessarily
spaces between words.
*/

import java.io.IOException;
import java.io.FileInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileWriter;

class FileCopy
{
   public static void main(String args[]) throws IOException 
   {    
	if(args.length<2){
		System.out.println("Usage:java FileCopy <inputfile> <outputfile>");
		return;
	}

	StringBuffer sb=new StringBuffer();
	String InputFile=args[0];
	String OutputFile=args[1];

	FileInputStream fin = new FileInputStream(InputFile);
	
	BufferedReader br =new BufferedReader(new InputStreamReader(fin));

	String line=br.readLine();

	while (line != null) {
		sb.append(line);
		line=br.readLine();
	}
	br.close();
	fin.close();

	//System.out.println(sb.toString());

	String[] words=sb.toString().split(" ");

	sb.delete(0, sb.length());

	for(int i=0;i<words.length;i++){

		if(!words[i].equals("")) {
			sb.append(words[i]);

			if(i!=words.length-1)
				sb.append(" ");			
		}
	}
	//System.out.println(sb.toString());

	FileWriter fout = new FileWriter(OutputFile);

	fout.write(sb.toString());
	fout.close();
	System.out.println("File copied successfully");
   }
}


    
