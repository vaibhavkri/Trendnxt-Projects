Time.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpAssignment3
{
    public class Time
    {
        int m_iHours;   
        int m_iMinutes;
        int m_iSeconds;

        public int iHours 
        {
            get
            {
                return m_iHours;
            }
            set
            {
                m_iHours=value;
            }
        }

        public int iMinutes 
        {
            get
            {
                return m_iMinutes;
            }
            set
            {
                m_iMinutes=value;
            }
        }
        
        public int iSeconds 
        {
            get
            {
                return m_iSeconds;
            }
            set
            {
                m_iSeconds=value;
            }
        }

        public Time()
        {
            iHours = 0;
            iMinutes = 0;
            iSeconds = 0;
        }

        public Time(int iMin)
        {
            iHours = iMin / 60;
            iMinutes = iMin % 60;
        }

        Time(long iSec)
        {
            iHours = (int)iSec / 3600;
            int tempSeconds = (int)iSec % 3600;
            iMinutes = tempSeconds / 60;
            iSec = tempSeconds % 60;
        }

    }
}
