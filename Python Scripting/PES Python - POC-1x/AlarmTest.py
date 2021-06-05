import unittest
from Alarmaction import AddAlarm,UpdateAlarm,DeleteAlarm,ClearAlarm,CountAlarm,
GetAlarm,alarm

class AlarmTest(unittest.TestCase):
  def test_1_add(self):
    n=input("enter number of alarms to be added :")
    for i in range(n):
      id=    int(raw_input("enter id      :"))
      title=     raw_input("enter title   :")
      time=      raw_input("enter time    :")
      repeat=    raw_input("repeat        :")
      AddAlarm(id,title,time,repeat)
    self.assertEqual(CountAlarm(),n) 
  
  def test_2_get(self):
    id=int(raw_input("enter the alarm id for details  :"))
    self.assertTrue(GetAlarm(id))
    
  def test_3_update(self):
    id=    int(raw_input("enter id to be updated      :"))
    title=     raw_input("enter title   :")
    time=      raw_input("enter time    :")
    repeat=    raw_input("repeat        :")
    UpdateAlarm(id,title,time,repeat)
    self.assertEqual(GetAlarm(id),(title,time,repeat))
    
  def test_4_remove(self):
    id=    int(raw_input("enter id to be removed      :"))
    DeleteAlarm(id)
    self.assertFalse(GetAlarm(id))  
    
  def test_5_clear(self):
    print "in clear case"
    self.assertTrue(ClearAlarm())
    
    
if __name__ == "__main__":
  unittest.main()