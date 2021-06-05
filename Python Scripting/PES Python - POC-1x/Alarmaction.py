alarm={}
def AddAlarm(id,title,time,repeat):
  alarm[id]=(title,time,repeat)
def UpdateAlarm(id,title,time,repeat):
  alarm[id]=(title,time,repeat)
def DeleteAlarm(id):
  del alarm[id]
def ClearAlarm():
  try:
    alarm.clear()
    return True
  except Exception as e:
    print e
    return False
def CountAlarm():
  return len(alarm)
def GetAlarm(id):
  x=alarm.get(id)
  if x==None:
    return False
  else:
    return x