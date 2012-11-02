#region Usings

using DataVehicles.Domain.Admin;
using Microsoft.VisualStudio.TestTools.UnitTesting;

#endregion

namespace DataVehicles4.UnitTests.DomainTests {
    [TestClass]
    public class WhenAuthorizeUser {
        [TestMethod]
        public void SuccessIfLoginAndPasswordIsCorrect() {
            var user = new User("pass", "login");

            Assert.IsTrue(user.Authorize("pass", "login"));
        }

        [TestMethod]
        public void UnsuccessIfLoginIsWrong() {
            var user = new User("login", "pass");

            Assert.IsFalse(user.Authorize("wrong login", "pass"));
        }

        [TestMethod]
        public void UnsuccessIfPasswordIsWrong() {
            var user = new User("login", "pass");

            Assert.IsFalse(user.Authorize("login", "wrong pass"));
        }
    }
}