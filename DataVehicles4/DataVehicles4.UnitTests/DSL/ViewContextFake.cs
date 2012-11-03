#region Usings

using System.Collections.Generic;
using DataVehicle4.ViewModel;

#endregion

namespace DataVehicles4.UnitTests.DSL {
    public class ApplicationContextFake : IApplicationContext {
        private readonly Dictionary<string, object> properties = new Dictionary<string, object>();

        public void ShowMainWindow() {
            IsMainWindowShown = true;
        }

        public void SaveProperty(string key, object value) {
            properties[key] = value;
        }

        public object GetProperty(string key) {
            if (!properties.ContainsKey(key)) return null;
            return properties[key];
        }

        public bool PropertyExists(string key) {
            return properties.ContainsKey(key);
        }

        public bool IsMainWindowShown { get; private set; }
    }
}