using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Windows;

namespace DataVehicles4.Client
{
    using DataVehicles4.ServiceProxy.DvServiceReference;

    using log4net;
    using log4net.Config;

    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {

        private static ILog log;

        static App()
        {

           /* XmlConfigurator.Configure();
            log = LogManager.GetLogger(typeof(App));*/
        }

       /* public ILog Logger
        {
            get { return log; }
        }*/

    }
}
