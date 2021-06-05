def oddTest():
    try:
        num=int(input("Enter a number to check  odd or not:"))
        if  num % 2:
                return "Passed"

        else:
                 return "Failed"
    except Exception as e:
                 print e
                 return "Error"

def primeTest():
    try:
        num=int(input("Enter a number to check prime or not:"))
        for i in range(2,num):
                             if num%i==0:
                                       return "Failed"
                             else:
                                       return "Passed"
    except Exception as e:
                             print e
                             return "Error"

def stringTest():
    try:
        string=raw_input("Enter a string  to check substring 'sub' :")
        if 'sub' in string:
            return "Passed"
        else:
             return "Failed"
    except Exception as e:
        print e
        return "Error"
                
                          
                 
