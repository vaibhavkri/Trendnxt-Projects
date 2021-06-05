/*
Assignment 1:
Write a program to create a sequential file that could store details about the six products. Details
include product id, cost & number of items available & are provided through the keyboard.
Perform following operations on it
a. Compute and print the total value of all six products.
b. Add new products
c. Display alternate products stored in the file.
*/

import java.util.Scanner;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.FileWriter;

class Product
{
	String product_id;
	float cost;
	int number_of_items;

	Product(String product_id,float cost,int number_of_items){

		this.product_id=product_id;
		this.cost=cost;
		this.number_of_items=number_of_items;	
	}

	static void PrintAll(Product[] pa){
			System.out.println(" Product_ID  Price  No_Of Items");
			System.out.println("--------------------------------");
		for(Product p : pa)
		    if(p!=null)
			System.out.printf("%8s %8s %8s \n",p.product_id,p.cost,p.number_of_items);		
	}

	static void WriteToFile(Product[] pa, String filename) throws IOException {

		BufferedWriter bw = new BufferedWriter(new FileWriter(filename));
			
		StringBuilder content=new StringBuilder();

		for(Product p : pa)
		    if(p!=null) {
			content.append(p.product_id+"###"+p.cost+"###"+p.number_of_items);
		  	content.append("\n");
		    }		

		//System.out.println(content.toString());
		bw.write(content.toString());
		bw.close();		
        }

	static void ComputeTotalValue(Product[] pa){
		float sum=0;
		
		for(Product p : pa){
		    if(p==null)	break;
		    sum+= (p.number_of_items * p.cost);
		}		

		System.out.println("Total Price:="+sum);
	}

	static void AddNewProduct(Product[] pa){
	
		int i=0;
		while(i<pa.length && pa[i]!=null)i++;

		if(i==pa.length){
			System.out.println("No space left");
			return;
		}

		String product_id;
		float cost;
		int number_of_items;

		Scanner sc=new Scanner(System.in);
		System.out.print("Product_id:");
		product_id=sc.nextLine();
		System.out.print("Cost:");
		cost=sc.nextFloat();
		System.out.print("Number_of_items:");
		number_of_items=sc.nextInt();

		pa[i]=new Product(product_id,cost,number_of_items);		
	}

	static Product[] ReadFileContents(FileInputStream fin) throws IOException {

		Product[] pr= new Product[6];

		BufferedReader br =new BufferedReader(new InputStreamReader(fin));

		String line = br.readLine();
		int i=0;
		while (line != null) {
			//System.out.println(line);

			String[] str=line.split("###");
			pr[i++]=new Product(str[0],Float.parseFloat(str[1]),Integer.parseInt(str[2]));

			line = br.readLine();
		}
		br.close();
		return pr;
	}
}


class ProductFile
{
   public static void main(String args[]) throws IOException 
   {    
	FileInputStream in = new FileInputStream("product.txt");

	Product[] pa = Product.ReadFileContents(in);

	Scanner sc=new Scanner(System.in);

	while(true){
		System.out.println("1. Compute and print the total value of all six products.");
		System.out.println("2. Add new products.");
		System.out.println("3. Display alternate products stored in the file.");
		System.out.println("4. Exit");

		int choice=sc.nextInt();

		switch(choice){
			
			case 1: Product.ComputeTotalValue(pa);break;
			case 2: Product.AddNewProduct(pa); break;
			case 3: Product.PrintAll(pa); break;
			default: Product.WriteToFile(pa,"product.txt");
				 System.exit(0); break;
		}
	}
   }
}


    
