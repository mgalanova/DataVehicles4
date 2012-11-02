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

            Assert.IsFalse(context.View.IsWelcomeVisible);
        }
    }
}