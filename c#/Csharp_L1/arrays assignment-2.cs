using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays2
{
    public class Flute :Instrument
    {
        public override void play()
        {
            Console.WriteLine("Flute is playing  toot toot toot toot");
        }
    }
}

Guitar.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays2
{
   public class Guitar : Instrument
    {
        public override void play()
        {
            Console.WriteLine("Guitar is playing  tin  tin  tin");
        }
    }
}

Instrument.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays2
{
    public abstract class Instrument
    {
        public abstract void play();
        

    }

}

Piano.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays2
{
    public class Piano : Instrument
    {
        public override void play()
        {
            Console.WriteLine("Piano is playing  tan tan tan tan");
        }
    }
}

Program.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays2
{
    class Program
    {
        static void Main(string[] args)
        {
            Instrument[] instruments = new Instrument[10];
            instruments[0] = new Guitar();
            instruments[1] = new Piano();
            instruments[2] = new Flute();

            instruments[0].play();
            instruments[1].play();
            instruments[2].play();

            Console.ReadLine();
        }
    }
}
