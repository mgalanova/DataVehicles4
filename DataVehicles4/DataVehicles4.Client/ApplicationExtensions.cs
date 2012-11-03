using System.Windows;

namespace DataVehicles4.Client {
    public static class ApplicationExtensions {
        public static object GetPropertySafe(this Application application, string key) {
            if (!application.Properties.Contains(key)) return null;
            return application.Properties[key];
        }
    }
}