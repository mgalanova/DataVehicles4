#region Usings

using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using DataVehicles4.ServiceProxy.DvServiceReference;
using DevExpress.Xpf.Ribbon;

#endregion

namespace DataVehicles4.Client {
    /// <summary>
    ///   The main window.
    /// </summary>
    public partial class MainWindow : DXRibbonWindow {
        public MainWindow() {
            InitializeComponent();
            DataContext = new DataSource();
            new Welcome().ShowDialog();
        }
    }

    /// <summary>
    ///   The test data.
    /// </summary>
    public class TestData {
        /// <summary>
        ///   Gets or sets Text.
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        ///   Gets or sets Number.
        /// </summary>
        public int Number { get; set; }
    }

    /// <summary>
    ///   The test data view model.
    /// </summary>
    public class TestDataViewModel : INotifyPropertyChanged {
        /// <summary>
        ///   The data.
        /// </summary>
        private readonly TestData data;

        /// <summary>
        ///   Initializes a new instance of the <see cref="TestDataViewModel" /> class.
        /// </summary>
        public TestDataViewModel() {
            data = new TestData {Text = string.Empty, Number = 0};
        }

        /// <summary>
        ///   Gets or sets Text.
        /// </summary>
        public string Text {
            get { return Data.Text; }

            set {
                if (Data.Text == value) {
                    return;
                }

                Data.Text = value;
                RaisePropertyChanged("Text");
            }
        }

        /// <summary>
        ///   Gets or sets Number.
        /// </summary>
        public int Number {
            get { return Data.Number; }

            set {
                if (Data.Number == value) {
                    return;
                }

                Data.Number = value;
                RaisePropertyChanged("Number");
            }
        }

        /// <summary>
        ///   Gets Data.
        /// </summary>
        protected TestData Data {
            get { return data; }
        }

        #region INotifyPropertyChanged

        /// <summary>
        ///   The property changed.
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        ///   The on property changed.
        /// </summary>
        /// <param name="e"> The e. </param>
        protected virtual void OnPropertyChanged(PropertyChangedEventArgs e) {
            if (PropertyChanged != null) {
                PropertyChanged(this, e);
            }
        }

        /// <summary>
        ///   The raise property changed.
        /// </summary>
        /// <param name="propertyName"> The property name. </param>
        protected void RaisePropertyChanged(string propertyName) {
            OnPropertyChanged(new PropertyChangedEventArgs(propertyName));
        }

        #endregion
    }

    /// <summary>
    ///   The data source.
    /// </summary>
    public class DataSource {
        /// <summary>
        ///   The source.
        /// </summary>
        private readonly ObservableCollection<TestDataViewModel> source;

        /// <summary>
        ///   Initializes a new instance of the <see cref="DataSource" /> class.
        /// </summary>
        public DataSource() {
            source = CreateDataSource();
        }

        /// <summary>
        ///   The create data source.
        /// </summary>
        /// <returns> </returns>
        protected ObservableCollection<TestDataViewModel> CreateDataSource() {
            var res = new ObservableCollection<TestDataViewModel>();
            res.Add(new TestDataViewModel {Text = GetDataFromService(0), Number = 0});
            res.Add(new TestDataViewModel {Text = GetDataFromService(1), Number = 1});
            res.Add(new TestDataViewModel {Text = GetDataFromService(2), Number = 2});
            res.Add(new TestDataViewModel {Text = GetDataFromService(3), Number = 3});
            res.Add(new TestDataViewModel {Text = "Row4", Number = 4});
            res.Add(new TestDataViewModel {Text = "Row5", Number = 5});
            res.Add(new TestDataViewModel {Text = "Row6", Number = 6});
            res.Add(new TestDataViewModel {Text = "Row7", Number = 7});
            res.Add(new TestDataViewModel {Text = "Row8", Number = 8});
            res.Add(new TestDataViewModel {Text = "Row9", Number = 9});
            return res;
        }

        private string GetDataFromService(int dataId) {
            using (var proxy = new DvServiceClient("DvService")) {
                var data = proxy.GetData(dataId);
                return data;
            }
        }

        private static bool customXertificateValidation(object sender, X509Certificate cert, X509Chain chain, SslPolicyErrors error) {
            var certificate = (X509Certificate2) cert;

            // Inspect the server certficiate here to validate 
            // that you are dealing with the correct server.
            // If so return true, if not return false.
            return true;
        }

        /// <summary>
        ///   Gets Data.
        /// </summary>
        public ObservableCollection<TestDataViewModel> Data {
            get { return source; }
        }
    }
}