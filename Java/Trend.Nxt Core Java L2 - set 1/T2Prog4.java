/*
Assignment 4:
Write a java program to display list of available currencies, currency codes, and display the
currency symbol based on user currency input. For example, for USD, the symbol is "$".
[Hint : use Currency class]
*/

import java.util.Currency;
import java.util.Set;
import java.util.Locale;
import java.util.Scanner;
import java.text.NumberFormat;

class MyCurrency
{
    public static void main(String[] as) throws Exception
    {
        Set<Currency> currencySet= Currency.getAvailableCurrencies();
	
	System.out.println("Currency Name                              Currency Code");
	System.out.println("-----------------------------------------------------------");
        for(Currency currency : currencySet){
            System.out.printf("%40s  %10s\n",currency.getDisplayName(),currency.getCurrencyCode());
	}

	System.out.print("Enter Currency code(Ex:USD): ");
	Scanner S=new Scanner(System.in);
	String str=S.nextLine();
	if(getLocale(str)==null)
		System.out.println("Wrong Input/Currency not available");
	else
		System.out.println("Symbol: "+Currency.getInstance(str).getSymbol(getLocale(str)));	
    }


    private static Locale getLocale(String strCode) {
     
	    for (Locale locale : Locale.getAvailableLocales()) {
		String code = NumberFormat.getCurrencyInstance(locale).getCurrency().getCurrencyCode();
		if (strCode.equals(code)) {
		    return locale;
		}
	    }  

	    return null;
    }
}


    
