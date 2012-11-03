#region Usings

using System.Linq;
using System.Windows;
using DataVehicle4.ViewModel;

#endregion

namespace DataVehicles4.Client {
    public class ApplicationContext : IApplicationContext {
        public void ShowMainWindow() {
            Application.Current.MainWindow = new MainWindow();
            Application.Current.MainWindow.Show();
            Application.Current.Windows.OfType<Welcome>().Single().Close();
        }

        public void SaveProperty(string key, object value) {
            Application.Current.Properties[key] = value;
        }

        public object GetProperty(string key) {
            return (string) Application.Current.GetPropertySafe(key);
        }
    }
}