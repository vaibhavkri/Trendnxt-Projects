import re
import threading
import glob
import sys
def find_derived_class(fname,pattern,old_pattern):
    new_pattern="\("+pattern+"\)"
    f=open(fname,'r')
    for line in f:
        lo=re.findall(new_pattern,line)
        if len(lo)>0:
            low=re.findall('class (\w+)',line)
            obj=" ".join(low)
            if old_pattern=="display":
                fw.write(pattern+"\n")
            fw.write("   "+obj+" "+"["+fname+"]"+"\n")
    f.close()
files=glob.glob(sys.argv[1]+'/*py')
all_class=[]
iter=0
old_pattern=""
fw=open('files_py.out','a')
for i in files:
    fh=open(i,'r')
    cnt=0
    for line in fh:
        list_file=[]
        all_class=re.findall('class (\w+)',line)
        if len(all_class)==0:
            continue
        if old_pattern!=all_class[0]:
            fw.write(all_class[0]+"\n")
        for j in range(len(all_class)):
            list_file=[]
            for file in files:
                list_file=[]
                list_file.append(threading.Thread(name=all_class[j],target=find_derived_class,args=(file,all_class[j],old_pattern,)))
                list_file[j].start()
        for j in range(len(list_file)):
            list_file[j].join()
    iter+=1
    fh.close()
fw.close()
