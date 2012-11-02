using DataVehicles.Domain.Admin;
using System.Linq;

namespace DataVehicles4.DataAccess.Users {
    public class AdminRepository {
        private readonly AdminDataContext dataContext;

        public AdminRepository(AdminDataContext dataContext) {
            this.dataContext = dataContext;
        }

        public bool CheckIfUserExists(string userLogin) {
            return dataContext.users.Any(_ => _.login == userLogin);
        }

        public User GetUserToAuthorize(string userLogin) {
            var dboUser = dataContext.users.Single(_ => _.login == userLogin);
            return new User(userLogin, dboUser.pwd_hash);
        }
    }
}