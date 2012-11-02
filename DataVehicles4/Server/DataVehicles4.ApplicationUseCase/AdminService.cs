using DataVehicles4.DataAccess.Users;

namespace DataVehicles4.ApplicationUseCase {
    public class AdminService {
        public bool Authorize(string userLogin, string password) {
            var repository = new AdminRepository();
            var user = repository.GetUserToAuthorize(userLogin);
            return user.Authorize(userLogin, TODO);
        }
    }
}