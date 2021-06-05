import sys
import threading
import glob
def combine_thread():
    fo=open('all.out','r')
    outlines=fo.readlines()
    outlines.sort()
    print " ".join(outlines)
def thread_fn(fname):
    text=" "
    out=""
    word_cnt,line_cnt=0,0
    f=open(fname,'r')
    fw=open('all.out','a+')
    for lines in f:
        l=lines.split()
        no_of_words=len(l)
        word_cnt=word_cnt+no_of_words
        line_cnt=line_cnt+1
    out=fname+text+str(word_cnt)+text+str(line_cnt)+'\n'
    fw.write(out)
    f.close()
    fw.close()
k=0
threads=[]
for i in range(len(sys.argv)):
     k=i+1
     if k>(len(sys.argv)-1):
         break
     threads.append(threading.Thread(name=sys.argv[k],target=thread_fn,args=(sys.argv[k],)))
     threads[i].start()
for j in range(len(sys.argv)):
     if j>(len(sys.argv)-2):
         break
     threads[j].join()
combine_thread()
