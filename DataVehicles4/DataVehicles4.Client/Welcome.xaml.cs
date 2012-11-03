#region Usings

using System.Linq;
using System.Windows;
using System.Windows.Data;
using DataVehicle4.ViewModel;
using DevExpress.Xpf.Core;

#endregion

namespace DataVehicles4.Client {
    /// <summary>
    ///     Interaction logic for Welcome.xaml
    /// </summary>
    public partial class Welcome : DXWindow {
        public Welcome() {
            InitializeComponent();
        }

        private void OnPasswordChanged(object sender, RoutedEventArgs e) {
            var viewModel = (WelcomeViewModel) Resources.Values.OfType<ObjectDataProvider>().Single().ObjectInstance;
            viewModel.Password = password.Password;
        }

        private void OnLoad(object sender, RoutedEventArgs e) {
            var viewModel = (WelcomeViewModel) Resources.Values.OfType<ObjectDataProvider>().Single().ObjectInstance;
            password.Password = viewModel.Password;
        }
    }
}