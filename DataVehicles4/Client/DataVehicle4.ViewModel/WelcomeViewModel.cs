#region Usings

using System;
using System.Windows;
using System.Windows.Input;
using DataVehicles4.ServiceProxy.AdminServiceReference;

#endregion

namespace DataVehicle4.ViewModel {
    public class WelcomeViewModel : ViewModel {
        private readonly IContext context;

        public WelcomeViewModel(IContext context) {
            this.context = context;
            LogInCommand = new Command(LogIn);
        }

        public string UserLogin { get; set; }
        public string Password { get; set; }
        public bool RememberMe { get; set; }
        public ICommand LogInCommand { get; private set; }

        private void LogIn() {
            if (!AdminService.Authorize(UserLogin, Password)) {
                throw new ApplicationException("You are not authorized");
            }

            context.View.CloseWelcome();
        }

        private IAdminService AdminService {
            get { return context.Service<IAdminService>(); }
        }
    }
}