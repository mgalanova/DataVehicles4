using DataVehicles.Domain.Admin;

namespace DataVehicles4.DataAccess.Users {
    public class AdminRepository {
        public User GetUserToAuthorize(string userLogin) {
            return new User(userLogin, TODO);
        }
    }
}