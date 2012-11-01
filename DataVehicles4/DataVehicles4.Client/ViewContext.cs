#region Usings

using System;
using System.Windows;
using DataVehicle4.ViewModel;

#endregion

namespace DataVehicles4.Client {
    public class ViewContext : IViewContext {
        public void ShowMainWindow() {
            var window = new MainWindow();
            var loginWindow = Application.Current.Windows[0];
            Application.Current.MainWindow = window;
            window.Show();
            loginWindow.Close();
        }
    }
}