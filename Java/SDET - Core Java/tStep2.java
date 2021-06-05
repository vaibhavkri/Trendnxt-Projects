//Assignment Step 2
import java.util.Scanner;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AssignmentStep2 {

	public static void main(String[] args) {
		do
		{
		//Getting query
		System.out.println("Please Enter The Query :\n");
		Scanner sc = new Scanner(System.in);
		String query = sc.nextLine().toUpperCase();
		//If query is correct
		if(query.contains("SELECT"))
		{ 
		QueryParser queryParser = new QueryParser();
		queryParser.parseQuery(query);
		break;
		}
		//If query is wrong
		else
		{
			System.out.println("\nPlease Enter Valid Select Query :\n ");		
		}
		}while(true);
	
	}

}

class QueryParameters {

	private String queryString;
	private static String file;
	private String baseQuery;
	private List<Restriction> restrictions;
	private static List<String> fields;
	private String queryType;
	private List<String> logicalOperators;
	 static String result[][];
	private List<AggregateFunction> aggregateFunctions;
	private List<String> orderByFields;
	private List<String> groupByFields;

	public void printQueryParameters() {
		System.out.println("QueryString :\t"+ this.queryString);
		System.out.println("File Name :\t"+ this.file);
		System.out.println("Restrictions :\t"+ this.restrictions);
		System.out.println("Fields :\t"+ this.fields);
		System.out.println("Query Type :\t"+ this.queryType);
		System.out.println("Logical Operators :\t"+ this.logicalOperators);
		System.out.println("Aggregate Functions :\t"+ this.aggregateFunctions);
		System.out.println("Order By Fields :\t"+ this.orderByFields);
		System.out.println("Group By Fields :\t"+ this.groupByFields);
		System.out.println("Base Query :\t"+this.baseQuery);

	}
	public static  String[][] result(String[][] arr) {
		// TODO Auto-generated method stub
		List<String> field=fields;
		int k=0;
		result=new String[arr.length][field.size()];
		for (int i=0;i<arr.length;i++)	
			
		{
			for (int j=0;j<arr[0].length;j++)
			if (field.contains(arr[0][j].trim().toUpperCase()))
			{
				
				result[i][k]=arr[i][j];
				
				k++;
				}
			k=0;
		}
		
		return result;
		
		}
	public String getQueryString() {
		return queryString;
	}

	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}

	public static String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getBaseQuery() {
		return baseQuery;
	}

	public void setBaseQuery(String baseQuery) {
		this.baseQuery = baseQuery;
	}

	public List<Restriction> getRestrictions() {
		return restrictions;
	}

	public void setRestrictions(List<Restriction> restrictions) {
		this.restrictions = restrictions;
	}

	public List<String> getFields() {
		return fields;
	}

	public void setFields(List<String> fields) {
		this.fields = fields;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public List<String> getLogicalOperators() {
		return logicalOperators;
	}

	public void setLogicalOperators(List<String> logicalOperators) {
		this.logicalOperators = logicalOperators;
	}

	public List<AggregateFunction> getAggregateFunctions() {
		return aggregateFunctions;
	}

	public void setAggregateFunctions(List<AggregateFunction> aggregateFunctions) {
		this.aggregateFunctions = aggregateFunctions;
	}

	public List<String> getOrderByFields() {
		return orderByFields;
	}

	public void setOrderByFields(List<String> orderByFields) {
		this.orderByFields = orderByFields;
	}

	public List<String> getGroupByFields() {
		return groupByFields;
	}

	public void setGroupByFields(List<String> groupByFields) {
		this.groupByFields = groupByFields;
	}

	


}

class AggregateFunction {

	private String field;
	private int result;
	private String function;
	private int aggregateFieldIndex;
	
	public void AggregateFunction(String field,  String function) {

		this.field = field;
		this.function = function;

	}
	public String getField() {
		return field;
	}

	public  void setField(String field) {
		this.field = field;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public int getAggregateFieldIndex() {
		return aggregateFieldIndex;
	}

	public void setAggregateFieldIndex(int aggregateFieldIndex) {
		this.aggregateFieldIndex = aggregateFieldIndex;
	}
	
	
}

class Restriction {
	
	private String propertyName;
	private String propertyValue;
	private String condition;
	
	public  void Restrictions(String propertyName, String propertyValue, String condition) {

		this.propertyName = propertyName;
		this.propertyValue = propertyValue;
		this.condition = condition;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getPropertyValue() {
		return propertyValue;
	}
	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
 
}
class QueryParser {

	public QueryParameters parseQuery(String query) {
		QueryParameters queryParameters = new QueryParameters();

		List<Restriction> restrictions = new ArrayList<>();
		List<AggregateFunction> aggregateFunctionList = new ArrayList<>();

		List<String> orderByFields = null;
		List<String> groupByFields = null;
		List<String> fieldList = new ArrayList<>();


		List<String> listOfOperators = new ArrayList<>();


		String[] Array1 = query.split(" ");
		int where=0;
		String filename="";
		String base="";
		String filter="";
		int count =0;

				//a.   Printing the split
				for(int i=0; i< Array1.length ; i++)
				{
					if(Array1[i].contains("WHERE"))
					{
					where=i;
					break;
					}
					else
					{
					where=Array1.length ;
					}
				}
				if(query.contains("WHERE"))
				{
				String[] Array2 = query.split("WHERE");
				base=Array2[0].trim();
				filter=Array2[1].trim();
				}
				else
				{
				base=query;
				filter="";
				}
				//b.
				//1.    Printing filename
				filename=Array1[where-1];
				

				if(filter.contains("ORDER BY")||filter.contains("GROUP BY"))
				{
					
					String[] restriction1 = filter.split("(\\sORDER BY\\s|\\sGROUP BY\\s)");
					String[] q = restriction1[0].split("(\\sAND\\s|\\sOR\\s|\\sNOT\\s)");

					for (int i = 0; i < q.length; i++) {
						String[] q1 = q[i].trim().split(" ");

						Restriction restriction = new Restriction();
						restriction.setPropertyName(q1[0]);
						restriction.setCondition(q1[1]);
						restriction.setPropertyValue(q1[2]);

						restrictions.add(restriction);

						queryParameters.setRestrictions(restrictions);
					

					}

		
				}
				
				if(filter.contains("ORDER BY")||filter.contains("GROUP BY"))
				{
					String orderby="";
					String groupby="";
					if(filter.indexOf("ORDER BY")>filter.indexOf("GROUP BY"))
					{
						String[] Array = filter.split("ORDER BY");
						orderby=Array[1].trim();
						if(filter.contains("GROUP BY"))
						{
						String[] Array2 = Array[0].split("GROUP BY");
						groupby=Array2[1].trim();
						}
					}
					else
						{
							String[] Array = filter.split("GROUP BY");
							groupby=Array[1].trim();
							if(filter.contains("ORDER BY"))
							{
							String[] Array2 = Array[0].split("ORDER BY");
							orderby=Array2[1].trim();
						}}
					
					orderByFields = Arrays.asList(orderby.split("\\ \\,"));
					groupByFields = Arrays.asList(groupby.split("\\ \\,"));
					
				}	
					
				
				
				
				
				

					
					
		
				
				
				
				
					
				if (base.contains("*"))
				{
					fieldList=Arrays.asList("All","Fields");
				}
				else
				{
					
				String[] Array= base.split("\\ |\\,");
				for(int i=1; i < Array.length-2; i++) 
					{
					if(!(Array[i].contains("MIN") || Array[i].contains("MAX") || Array[i].contains("COUNT")|| Array[i].contains("AVG")|| Array[i].contains("SUM")))
					{	

					fieldList.add(Array[i]);
						}
						}
				}
						
						
						
						
						
						String[] Array= base.split(" ");
						for(int i=1; i < Array.length-2; i++) 
						{
						
						if(Array[i].contains("MIN") || Array[i].contains("MAX") || Array[i].contains("COUNT")|| Array[i].contains("AVG")|| Array[i].contains("SUM"))
						{
						//	 aggregate function
							

							String[] aggregateFunctionExtract = base.trim().split(" ");
							String[] aggregateFunctionArray = aggregateFunctionExtract[1].trim().split(",");

							for (String s : aggregateFunctionArray) {

								if (!(!s.toLowerCase().contains("sum(") && !s.toLowerCase().contains("count(")
										&& !s.toLowerCase().contains("avg(") && !s.toLowerCase().contains("min(")
										&& !s.toLowerCase().contains("max("))) {

									AggregateFunction aggregateFunction = new AggregateFunction();
									String[] aggregateFunctions = s.split("(\\(|\\))");
									aggregateFunction.setAggregateFieldIndex(count);
									aggregateFunction.setFunction(aggregateFunctions[0]);
									aggregateFunction.setField(aggregateFunctions[1]);
									aggregateFunctionList.add(aggregateFunction);
									queryParameters.setAggregateFunctions(aggregateFunctionList);
									count++;
								}

							}
						}
							
				
					}
				

				String[] Array2 =filter.split(" ");
				for(int i =0; i< Array2.length; i ++) 
				{
					if(Array2[i].equals("OR") || Array2[i].equals("AND") || Array2[i].equals("NOT")  )
					{

						listOfOperators.add(Array2[i]);
					}
				}
		
		
		
		queryParameters.setQueryString(query);
		queryParameters.setFile(filename);
		queryParameters.setBaseQuery(base);
		queryParameters.setQueryType(Array1[0]);
		queryParameters.setFields(fieldList);
		queryParameters.setOrderByFields(orderByFields);
		queryParameters.setGroupByFields(groupByFields);
		queryParameters.setLogicalOperators(listOfOperators);
		queryParameters.setAggregateFunctions(aggregateFunctionList);
		queryParameters.printQueryParameters();
				
		return queryParameters;



}}