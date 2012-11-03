#region Usings

using DataVehicle4.ViewModel;
using DataVehicles4.UnitTests.DSL;
using Microsoft.VisualStudio.TestTools.UnitTesting;

#endregion

namespace DataVehicles4.UnitTests {
    [TestClass]
    public class WhenUserLogin {
        private ContextFake context;

        [TestInitialize]
        public void Init() {
            context = new ContextFake();
        }

        [TestMethod]
        public void ShowMainPage() {
            var viewModel = new WelcomeViewModel(context);

            viewModel.LogInCommand.Execute();

            Assert.IsTrue(context.Application.IsMainWindowShown);
        }

        [TestMethod]
        public void SaveLoginAndPasswordIfUserHitRememberMe() {
            var viewModel = new WelcomeViewModel(context);

            viewModel.RememberMe = true;
            viewModel.UserLogin = "login";
            viewModel.Password = "password";

            viewModel.LogInCommand.Execute();

            Assert.AreEqual("login", context.Application.GetProperty("UserLogin"));
            Assert.AreEqual("password", context.Application.GetProperty("Password"));
        }
    }
}