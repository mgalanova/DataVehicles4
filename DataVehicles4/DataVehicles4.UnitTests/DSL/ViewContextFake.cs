#region Usings

using DataVehicle4.ViewModel;

#endregion

namespace DataVehicles4.UnitTests.DSL {
    public class ApplicationContextFake : IApplicationContext {
        public void ShowMainWindow() {
            IsMainWindowShown = true;
        }

        public void SaveProperty(string key, string value) {}

        public string GetProperty(string key) {
            return "";
        }

        public bool IsMainWindowShown { get; private set; }
    }
}