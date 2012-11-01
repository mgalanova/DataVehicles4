#region Usings

using System.Linq;
using System.Windows;
using DataVehicle4.ViewModel;

#endregion

namespace DataVehicles4.Client {
    public class ViewContext : IViewContext {
        public void CloseWelcome() {
            Application.Current.Windows.OfType<Welcome>().Single().Close();
        }
    }
}