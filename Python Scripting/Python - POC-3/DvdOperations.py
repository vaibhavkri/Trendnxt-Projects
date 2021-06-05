import mysql.connector
from mysql.connector.errors import ProgrammingError
from mysql.connector import Error
database = "db4"
class DvdStore():
    @classmethod
    def AddDvd(self):
        try:
            title = input("enter title of the dvd : ")
            star_name = input("enter star name of the dvd : ")
            year_of_release = input("enter year of release : ")
            genre = input("enter genre of the dvd : ")
            mydb1 = mysql.connector.connect(
                host="localhost",
                user="Vaibhav",
                passwd="Vaibhav@007",
                database=database
            )
            mycursor1 = mydb1.cursor()
            s2 = """INSERT INTO DVDSTORE (title, star_name, year_of_release, genre) VALUES(%s,%s,%s,%s)"""
            v2 = (title, star_name, year_of_release, genre)

            mycursor1.execute(s2, v2)
            mydb1.commit()
            print("DVD added successfully")


        except mysql.connector.Error as error:
            print("failed because : {}".format(error))\


        finally:
            if mydb1.is_connected():
                mydb1.close()


    @classmethod
    def SearchDvd(self):
        try:
            search_key = input("enter search key : ")
            print("1.	Drama\n2.	Horror\n3.	Comedy\n4.	Romance\n5.	 Action\n6.  All")
            genre2 = input("enter genre : ")
            mydb2 = mysql.connector.connect(
                host="localhost",
                user="Vaibhav",
                passwd="Vaibhav@007",
                database=database
            )
            mycursor2 = mydb2.cursor()
            mycursor2.execute("SELECT * FROM DVDSTORE")
            myresult2 = mycursor2.fetchall()
            for word in myresult2:
                if search_key in word:
                    if genre2 == '1':
                        if "drama" in word:
                            print(word)

                    elif genre2 == '2':
                        if "horror" in word:
                            print(word)

                    elif genre2 == '3':
                        if "comedy" in word:
                            print(word)

                    elif genre2 == '4':
                        if "romance" in word:
                            print(word)

                    elif genre2 == '5':
                        if "action" in word:
                            print(word)

                    elif genre2 == '6':
                        print(word)


            print("search is completed")


        except mysql.connector.Error as error:
            print("failed because : {}".format(error))

        finally:
            if mydb2.is_connected():
                mydb2.close()



    @classmethod
    def ModifyDvd(self):
        try:
            a3 = input("enter which do you want to modify : ")
            b3 = input("final output you want to store : ")
            mydb3 = mysql.connector.connect(
                host="localhost",
                user="Vaibhav",
                passwd="Vaibhav@007",
                database=database
            )
            mycursor3 = mydb3.cursor()
            mycursor3.execute("SELECT * FROM DVDSTORE")
            myresult3 = mycursor3.fetchall()
            for word in myresult3:
                if a3 in word:
                    c=0
                    for i in word:
                        c = c+1
                        if a3 == i:
                            if c == 2:
                                x32 = "UPDATE DVDSTORE SET title = %s WHERE title = %s"
                                y32 = (b3, a3)
                                mycursor3.execute(x32, y32)
                            elif c == 3:
                                x33 = "UPDATE DVDSTORE SET star_name = %s WHERE star_name = %s"
                                y33 = (b3, a3)
                                mycursor3.execute(x33, y33)
                            elif c == 4:
                                x34 = "UPDATE DVDSTORE SET year_of_release = %s WHERE year_of_release = %s"
                                y34 = (b3, a3)
                                mycursor3.execute(x34, y34)
                            elif c == 5:
                                x35 = "UPDATE DVDSTORE SET genre = %s WHERE genre = %s"
                                y35 = (b3, a3)
                                mycursor3.execute(x35, y35)
            mydb3.commit()
            print("modify completed")


        except mysql.connector.Error as error:
            print("error occured because : {}".format(error))

        finally:
            if mydb3.is_connected():
                mydb3.close()

    @classmethod
    def DeleteDvd(self):
        try:
            title = input("enter the title which you want to delete : ")
            mydb4 = mysql.connector.connect(
                host="localhost",
                user="Vaibhav",
                passwd="Vaibhav@007",
                database=database
            )
            mycursor4 = mydb4.cursor()
            s4 = "DELETE FROM DVDSTORE WHERE title = %s"
            v4 = (title, )
            mycursor4.execute(s4, v4)
            mydb4.commit()
            print("deleted")

        except mysql.connector.Error as error:
            print("error occured because : {}".format(error))

        finally:
            if mydb4.is_connected():
                mydb4.close()
