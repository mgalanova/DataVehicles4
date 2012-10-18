using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace DataVehicles4.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "DvService" in code, svc and config file together.
    public class DvService : IDvService
    {
        public string GetData(int value)
        {
            return string.Format("DvService: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
