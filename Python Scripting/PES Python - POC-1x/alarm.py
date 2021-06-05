class alarm(object):
    acount=0
    def add(self,d):
        print("Adding new alarm.......")
        aa=input("Alarm ID : ")
        a=[]
        a.append(raw_input("Title : "))
        a.append(input("Time : "))
        a.append(raw_input("Repeat (T/F) : "))
        d[aa]=a
        alarm.acount+=1
    def update(self,d):
        print("Updating an alarm........")
        a=input("Enter the alarm ID : ")
        c=input("Enter your choics\n1.Update Title\n2.Update Time\n3.Update Repeat\n")
        if(c==1):
            cc=raw_input("New Title : ")
            d[a][0]=cc
        elif(c==2):
            cc=input("New Time : ")
            d[a][1]=cc
        elif(c==3):
            cc=raw_input("Repeat (Y/N) : ")
            d[a][2]=cc
    def delete(self,d,a):
        print("Deleting an alarm........")
        del d[a]
        alarm.acount-=1
    def deleteall(self,d):
        d.clear()
        print("Deleting entire alarms........")
        alarm.acount=0
    def count(self,d):
        return alarm.acount
    def display(self,d,a):
        print("Displaying alarm data........") 
        try:
            d[a]
            print "ID =",a
            print "Title =",d[a][0]
            print "Time =",d[a][1]
            print "Repeat =",d[a][2]
        except KeyError:
            print "Error : Key not found"
d=dict()
s=alarm()
k=1
while(k==1):
    c=input("Enter your choice\n1.Add alarm\n2.Update alarm\n3.Delete an alarm\n4.Delete all alarms\n5.Display details of an alarm\n6.Display count\n7.Exit\n")
    if(c==1):
        s.add(d)
    elif(c==2):
        s.update(d)
    elif(c==3):
        cc=input("Enter an alarm ID to delete : ")
        s.delete(d,cc)
    elif(c==4):
        s.deleteall(d)
    elif(c==5):
        cc=input("Enter an alarm ID to display : ")
        s.display(d,cc)
    elif(c==6):
        print "Total Alarms =",s.count(d)
    elif(c==7):
        k=0
        break
    else:
        print "Wrong Entry"
    print
