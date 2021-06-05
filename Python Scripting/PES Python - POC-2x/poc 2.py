import smtplib
#import sys
#print(sys.path)
#sys.path.append('C:\Program Files (x86)\Python36-32\Lib\site-packages')
#sys.path.append('C:\Python34\Lib\site-packages')
import xlrd
import mysql
from mysql.connector import Error,MySQLConnection

#connecting to schema
conn=mysql.connector.connect(host='localhost',database='bank',user='root',password='password')
def connect():
    try:
        if conn.is_connected():
            print("Connected to database")
    except Error as e:
        print(e)
    finally:
        print()
connect()
cur=conn.cursor()


create_query="""CREATE TABLE poc2(userid int(90),name varchar(45),email varchar(90),amount int(10),primary key(userid))"""
cur.execute(create_query)

insert_query=("INSERT INTO poc2(userid,name,email,amount) VALUES(%s,%s,%s,%s)")

#fetching data from excel sheet
book= xlrd.open_workbook("poc2x.xlsx")
sheet = book.sheet_by_index(0)
for i in range(1,sheet.nrows): 
    uid=sheet.cell(i,0).value
    name=sheet.cell(i,1).value
    email=sheet.cell(i,2).value
    #print(type(sheet.cell(i,3).value),sheet.cell(i,3).value)
    amount=int(float((sheet.cell(i,3).value)))
    values=(uid,name,email,amount)
    #print(values)
    cur.execute(insert_query,values)
    cur.execute("commit")        

#funtion for sending email to user on request
def email_reqst(userid,msg="Account details request"):
    
    email_query=("select email from poc2 where userid='%s'"%(userid))
    cur.execute(email_query)
    l=cur.fetchall()
    email=l[0][0]
    #print(email)

    q1=("select * from poc2 where userid='%s'"%(userid))
    cur.execute(q1)
    r=cur.fetchall()
    uid="id:%s"%(r[0][0])
    name="name:%s"%(r[0][1])
    email="email:%s"%(r[0][2])
    amount="amount:%s"%(r[0][3])
    ad=uid+'\n'+name+'\n'+email+'\n'+amount
    
    try:
        server=smtplib.SMTP('smtp.office365.com',587)
        server.ehlo()
        server.starttls()
        server.login("bo377017@wipro.com","********")

        header = 'To:' + email + '\n' + 'From: HINDU\n' + 'Subject:Account details\n'
        content=header+'\n'+msg+'\n'+ad
        
        server.sendmail("bo377017@wipro.com",email,content)
        
    except Error as e:
        print(e)
    else:
        print("-->An email sent to ur registered email id...!")
    
print("<<<Menu>>>\n1.Email notification request\n2.Deposit\n3.Withdrawl\n")
ch=int(input("Enter ur choice(1/2/3):"))
c=[1,2,3]
if ch in c:
    userid=input("Enter user id:")
    q1=("select userid from poc2")
    cur.execute(q1)
    l1=cur.fetchall()
    f=1
    for i in l1:
        if userid in i:
            print("...Valid user id..ur registered...!")
            f=0
            if ch==1:
                email_reqst(userid)
            if ch==2:
                deposit=float(input("Enter amoun to be deposited:"))
                update_query=("update poc2 set amount=(amount+%d)where userid='%s'"%(deposit,userid))
                cur.execute(update_query)
                cur.execute("commit")
                print("amount deposited successfully..:)")
                email_reqst(userid,"Deposited..Account Details")
            if ch==3:
                withdraw=float(input("Enter amoun to be withdrawn:"))
                update_query=("update poc2 set amount=(amount-%d)where userid='%s'"%(withdraw,userid))
                cur.execute(update_query)
                cur.execute("commit")
                print("Transaction success")
                email_reqst(userid,"withdrawn...Account Details")
    if(f==1):
        print("your not a regisred user...!")

else:
    print("Invalid option choosen..!Try again")
