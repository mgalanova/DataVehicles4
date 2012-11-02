#region Usings

using System.ServiceModel;

#endregion

namespace DataVehicles4.Service {
    [ServiceContract]
    public interface IAdminService {
        [OperationContract]
        bool Authorize(string userLogin, string password);
    }
}