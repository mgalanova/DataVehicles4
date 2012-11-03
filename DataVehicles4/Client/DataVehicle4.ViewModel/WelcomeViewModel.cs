#region Usings

using System;
using System.Windows.Input;
using DataVehicles4.ServiceProxy.AdminServiceReference;

#endregion

namespace DataVehicle4.ViewModel {
    public class WelcomeViewModel : ViewModel {
        private readonly IContext context;

        public WelcomeViewModel(IContext context) {
            this.context = context;
            LogInCommand = new Command(LogIn);
            UserLogin = context.Application.GetProperty("UserLogin");
            Password = context.Application.GetProperty("Password");
        }

        public string UserLogin { get; set; }
        public string Password { get; set; }
        public bool RememberMe { get; set; }
        public ICommand LogInCommand { get; private set; }

        private void LogIn() {
            if (!AdminService.Authorize(UserLogin, Password)) {
                throw new ApplicationException("You are not authorized");
            }

            context.Application.SaveProperty("UserLogin", UserLogin);
            context.Application.SaveProperty("Password", Password);
            context.Application.ShowMainWindow();
        }

        private IAdminService AdminService {
            get { return context.Service<IAdminService>(); }
        }
    }
}