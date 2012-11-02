#region Usings

using System;

#endregion

namespace DataVehicles4.Service {
    public class AdminService : IAdminService {
        public bool Authorize(string userLogin, string password) {
            return new ApplicationUseCase.AdminService().Authorize(userLogin, password);
        }
    }
}