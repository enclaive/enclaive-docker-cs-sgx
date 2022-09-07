using System;
using System.Threading;

namespace Hello
{
    class Program
    {
        public static void Main (string[] args)
        {
            for (;;)  {

                string text = System.IO.File.ReadAllText(@"/app/hello.txt");
                System.Console.WriteLine("Contents of hello.txt = {0}", text);
                Thread.Sleep(1000);

            }

        }
    }
}
