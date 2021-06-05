import mysql.connector
from mysql.connector.errors import ProgrammingError
from mysql.connector import Error
from DvdOperations import DvdStore

database = "db4"

def CreateDatabase(database):
    mydb = mysql.connector.connect(
        host="localhost",
        user="Vaibhav",
        passwd="Vaibhav@007",
    )
    mycursor = mydb.cursor()
    mycursor.execute("CREATE DATABASE "+database)
    mydb.close()
    print("Database is created ")
    Function1()

def Function1():
    try:

        mydb1 = mysql.connector.connect(
            host="localhost",
            user="Vaibhav",
            passwd="Vaibhav@007",
            database=database
        )

    except mysql.connector.errors.ProgrammingError as error1:
        print("error occurred because : {}".format(error1))
        CreateDatabase(database=database)

    except mysql.connector.Error as error2:
        print("error occured because : {}".format(error2))
        exit
    else:
        mycursor = mydb1.cursor()
        s1 = "CREATE TABLE IF NOT EXISTS DVDSTORE (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255), star_name VARCHAR(255), year_of_release INT, genre VARCHAR(255))"
        mycursor.execute(s1)
        mydb1.commit()


def Function2():
    Function1()
    print("\nWELCOME TO DVD STORE ")
    print("1.	Add a DVD\n2.	Search\n3.	Modify a DVD\n4.	Delete a DVD\n5.	Exit")
    ch = int(input("Enter your choice : "))
    if ch == 1 :
        DvdStore.AddDvd()
        Function2()


    elif ch ==2 :
        DvdStore.SearchDvd()
        Function2()


    elif ch == 3:
        DvdStore.ModifyDvd()
        Function2()


    elif ch == 4:
        DvdStore.DeleteDvd()
        Function2()


    elif ch == 5:
        print("\nThank You !!! Visit Again")


    else:
        print("\nInvalid Choice !!! Enter Choice Again\n")
        Function2()

def PrintTable():
    mydb1 = mysql.connector.connect(
        host="localhost",
        user="Vaibhav",
        passwd="Vaibhav@007",
        database=database
    )
    mycursor = mydb1.cursor()
    mycursor.execute("SELECT * FROM DVDSTORE")
    myresult = mycursor.fetchall()
    for i in myresult:
        print(i)

Function2()