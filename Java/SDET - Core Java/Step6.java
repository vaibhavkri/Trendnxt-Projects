import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.util.logging.SimpleFormatter;



public class AssignmentStep6{
	public static void main(String[] args) throws IOException, ParseException {
		 String query;
		 String order;
		   QueryParser q;
		   QueryParameters k;
		   List<String> row=new ArrayList<String>();
		   List<String> fields1=new ArrayList<String>();
		   List<String> logic=new ArrayList<String>();
		   List<Integer> index =new ArrayList<Integer>();
		   List<Integer> c=new ArrayList<Integer>();
		   String dat[];
		   boolean flag=false,flag1=false,flag2=false;
		   String[][] datas = null;
		   String [] field;
		   HashMap<Integer, String[]> hmap = new HashMap<Integer, String[]>();
		   HashMap<Integer, List> rows= new HashMap<Integer, List>();
		   Scanner sc= new Scanner(System.in);
		   System.out.println("Enter the SQL Query(TYPE WITH SPACE)");
		   query=sc.nextLine();
		  
		  //parse query
		   q=new QueryParser();
		   
		   //get queryparameter object
		   k=q. parseQuery(query);
		   
		   //parse csv
		   row=readCsv(k.getFile());
		   
		   System.out.println();
		   int i=0;
		   
		   for(String a:row) {
			   dat=a.split(",");
			   hmap.put(i, dat);
			   i++;
		   }

		   fields1=k.getFields();
		   dat=hmap.get(0);
		   
			   for(String a:fields1) {
				   
				  for(i=0;i<dat.length;i++) {
				 
				if(a.equalsIgnoreCase("*")) {
					   flag=true;
					   break;
				   }
				   if(dat[i].equalsIgnoreCase(a)) {
					  
					   flag=false;
					   index.add(i);  
				   }
			   }   
		  }
			  
			   logic=k.getLogicalOperators();
			   String [] arr = logic.toArray(new String[logic.size()]);
			   if(logic.size()==0) {
				   flag1=true;
			   }
			  
		   row=Restrictions(hmap,dat,k);
		    List<Integer> one=rows.get(0);
		   System.out.println(row);
		   for(i=0;i<logic.size();i++) {
			   List<Integer> a=rows.get(i);
			   List<Integer> b=rows.get(i+1);
			  
			   if(arr[i].equalsIgnoreCase("and")) {
				   c = new ArrayList<Integer> (a.size() > b.size() ?a.size():b.size());
				   c.addAll(a);
				   c.retainAll(b);
				   
				   System.out.println(c);
			   }
			   else if(arr[i].equalsIgnoreCase("or")) {
				   c = new ArrayList<Integer>(a.size() + b.size());
				   addNoDups(c,a);
				   addNoDups(c,b);
				   System.out.println(c);
			   }
		   }
	
		   List<Integer> m =new ArrayList<Integer>();
		   if(flag1) {
				 m=one;
			  }
			  else {
				  m=c;
			  }
		   
		  System.out.println(m);
		  List<String> ordr=k.getOrderByFields();
		  if(ordr.size()!=0) {
			  flag2=true;
		  }
		  List<HashMap> or=new ArrayList<HashMap>();
		  List<HashMap> ss=new ArrayList<HashMap>();
		  List<List> os=new ArrayList<List>();
		  
		  for(String oo:ordr) {
			  System.out.println(ordr.size()); 
			  HashMap<Integer,String> ord=new HashMap<Integer,String>();
			  
			  for(i=0;i<dat.length;i++) {
			 if(oo.equalsIgnoreCase(dat[i])) {
				 for(int j=1;j<hmap.size();j++) {
					 String arra[]=hmap.get(j);
					 System.out.println(arra[i]);
					 System.out.println(j);
					 ord.put(j,arra[i]);
					 System.out.println(ord);
					 }
				 }
			 }
			 
			  or.add(ord);
		  }
		  
		  //Sorting and to list
		  for(HashMap as:or) {
			  System.out.println("Sortes");
			  ss.add(sortHashMapByValues(as));
			  List<Integer> mapKeys = new ArrayList<>(sortHashMapByValues(as).keySet());
			  
			  os.add(mapKeys);
			  System.out.println(os);
		  }
		   FileWriter file = new FileWriter("result.json");
		   if(m!= null) {  
			   for(int g:m) {
				   
			   String[] dat1=hmap.get(g);
			   JSONObject obj = new JSONObject();
			   
			   for(int j=0;j<dat1.length;j++) {
				   if(flag && flag2) {
					   for(List a:os) {
						   System.out.println("kk");
						   System.out.println(a);
						   
					   }
					   if(dat1[j].equals("")) {
						   dat1[j]=" ";}
					   obj.put(dat[j], dat1[j]);  
				   }
				   else {
					   
				   for(int b:index) {
					   if(dat1[j].equals("")) {
						   dat1[j]=" ";
				   }
					   if(b==j) {
						   obj.put(dat[j], dat1[j]);   
					   }
				   }
				   }
			   }  
			  
			   try{

		            file.write(obj.toJSONString());
		            file.flush();

		        } catch (IOException e) {
		            e.printStackTrace();
		        }

		       
		   
		   }
		   }
		   else  {
				   for(i=1;i<hmap.size();i++) {
					   
				   String[] dat1=hmap.get(i);
		
				   JSONObject obj = new JSONObject();
				   
				   for(int j=0;j<dat1.length;j++) {
					   if(flag) {//Select all fields
						   if(dat1[j].equals("")) {
							   dat1[j]=" ";
							   
						   }
						   obj.put(dat[j], dat1[j]);  
					   }
					   else {
					   for(int a:index) {
						   if(a==j) {//Select specified fields
							   if(dat1[j].equals("")) {
								   dat1[j]=" ";
								   
							   }
							   obj.put(dat[j], dat1[j]);   
						   }
					   }
					   }
				   }  
				  
				   try{

			            file.write(obj.toJSONString());
			            file.write("\n");
			            file.flush();

			        } catch (IOException e) {
			            e.printStackTrace();
			        }
			   
			   }
			   }
	}
		
	private static List<String> Restrictions(HashMap<Integer, String[]> hmap, String[] dat, QueryParameters k) {
		// TODO Auto-generated method stub
		
		return null;
	}

	public static LinkedHashMap<Integer, String> sortHashMapByValues( HashMap<Integer, String> passedMap) {
	    List<Integer> mapKeys = new ArrayList<>(passedMap.keySet());
	    List<String> mapValues = new ArrayList<>(passedMap.values());
	    Collections.sort(mapValues);
	    Collections.sort(mapKeys);

	    LinkedHashMap<Integer, String> sortedMap =new LinkedHashMap<>();

	    Iterator<String> valueIt = mapValues.iterator();
	    while (valueIt.hasNext()) {
	        String val = valueIt.next();
	        Iterator<Integer> keyIt = mapKeys.iterator();

	        while (keyIt.hasNext()) {
	            Integer key = keyIt.next();
	            String comp1 = passedMap.get(key);
	            String comp2 = val;

	            if (comp1.equals(comp2)) {
	                keyIt.remove();
	                sortedMap.put(key, val);
	                break;
	            }
	        }
	    }
	    return sortedMap;
	}
	
	static List<String> readRowsFromCSV(String file) {
		List<String> r = new ArrayList<>(); 
		Path pathToFile = Paths.get(file);
		try (BufferedReader br = Files.newBufferedReader(pathToFile, StandardCharsets.US_ASCII)) 
		{
		String line = br.readLine();
		while (line != null) {
		r.add(line);
		line = br.readLine();
		}
		}
		catch(IOException e) {
		e.printStackTrace(); 
		} 

		return r;
			}
		
public static void addNoDups(List<Integer> toAddTo,List<Integer> iterateOver) {
    for(Integer num:iterateOver){
        if(toAddTo.indexOf(num) == -1) {
            toAddTo.add(num);
        }
    }
}

static List<String> readCsv(String file) {
List<String> r = new ArrayList<>(); 
Path pathToFile = Paths.get(file);
try (BufferedReader br = Files.newBufferedReader(pathToFile, StandardCharsets.US_ASCII)) 
{
String line = br.readLine();
while (line != null) {
r.add(line);
line = br.readLine();
}
}
catch(IOException e) {
e.printStackTrace(); 
} 

return r;
	}


}




	
	
	
