AirTicket.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers1
{
    public class AirTicket
    {
        int _flightNumber;
        DateTime _flightDate;
        DateTime _flightTime;
        string _destination;

        public int flightNumber 
        {
            get
            {
                return _flightNumber;
            }
            set
            {
                _flightNumber = value;
            }
        }

        public DateTime flightDate 
        {
            get
            {
                return _flightDate;
            }
            set
            {
                _flightDate=value;
            }
        }
        public DateTime flightTime 
        {
            get
            {
                return _flightTime;
            }
            set
            {
                _flightTime = value;
            }
        }
        public string destination 
        {
            get
            {
               return _destination ;
            }
            set
            {
                _destination=value;
            }
        }
    }
}

ConfirmedTicket.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers1
{
    public class ConfirmedTicket :AirTicket
    {
        string _seatNumber;

        public string seatNumber 
        {
            get
            {
                return _seatNumber;
            }
            set
            {
                _seatNumber=value;
            }
        }
    }
}

RequestedTicket.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers1
{
    class RequestedTicket : AirTicket
    {
        string _status;
        public string status 
        {
            get
            {
                return _status;
            }
            set
            {
                _status=value;
            }
        }
    }
}
