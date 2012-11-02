using DataVehicles4.DataAccess.Users;

namespace DataVehicles4.ApplicationUseCase {
    public class AdminService {
        public bool Authorize(string userLogin, string password) {
            var repository = Repositories.New<AdminRepository>();

            if (!repository.CheckIfUserExists(userLogin)) return false;
            
            var user = repository.GetUserToAuthorize(userLogin);
            return user.Authorize(userLogin, password);
        }
    }
}