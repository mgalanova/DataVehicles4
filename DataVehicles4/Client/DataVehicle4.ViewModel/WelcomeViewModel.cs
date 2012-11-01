#region Usings

using System;
using System.Windows.Input;

#endregion

namespace DataVehicle4.ViewModel {
    public class WelcomeViewModel : ViewModel {
        private readonly IViewContext context;

        public WelcomeViewModel(IViewContext context) {
            this.context = context;
            LogInCommand = new Command(LogIn);
        }

        public string UserLogin { get; set; }
        public string Password { get; set; }
        public ICommand LogInCommand { get; private set; }

        private void LogIn() {
            context.ShowMainWindow();
        }
    }
}