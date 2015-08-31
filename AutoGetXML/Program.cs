#define Dev
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace AutoGetXML
{
    static class Program
    {
#if Dev
        private static void Main(string[] args)
        {
            Test test = new Test();
            test.OnStart();
        }

#else
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[] 
            { 
                new Service1() 
            };
            ServiceBase.Run(ServicesToRun);
        }
#endif
    }
}
