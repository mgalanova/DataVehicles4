#region Usings

using System;

#endregion

namespace DataVehicles.Domain.Admin {
    public class User {
        private readonly string login;
        private readonly string password;

        public User(string login, string password) {
            this.login = login;
            this.password = password;
        }

        public bool Authorize(string enteredLogin, string enteredPassword) {
            return login == enteredLogin && password == enteredPassword;
        }
    }
}