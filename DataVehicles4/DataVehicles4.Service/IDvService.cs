using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace DataVehicles4.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IDvService" in both code and config file together.
    [ServiceContract]
    public interface IDvService
    {

        [OperationContract]
        string GetData(int value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: Add your service operations here
    }
}
