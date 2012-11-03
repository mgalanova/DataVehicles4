#region Usings

using System;
using System.IO;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Windows;

#endregion

namespace DataVehicles4.Client {
    public partial class App : Application {
        protected override void OnStartup(StartupEventArgs e) {
            using (var isolatedStorage = IsolatedStorageFile.GetMachineStoreForAssembly()) {
                using (var isolatedFileStream = new IsolatedStorageFileStream("userDvSettings", FileMode.Open, isolatedStorage)) {
                    using (var reader = new StreamReader(isolatedFileStream)) {
                        var loginAndPassword = reader.ReadToEnd().Split(new[] {'\r', '\n'}, StringSplitOptions.RemoveEmptyEntries);
                        var login = loginAndPassword.First();
                        var password = loginAndPassword.Last();
                        Current.Properties["UserLogin"] = login;
                        Current.Properties["Password"] = password;
                    }
                }
            }
            base.OnStartup(e);
        }

        protected override void OnExit(ExitEventArgs e) {
            using (var isolatedStorage = IsolatedStorageFile.GetMachineStoreForAssembly()) {
                using (var isolatedFileStream = new IsolatedStorageFileStream("userDvSettings", FileMode.Create, isolatedStorage)) {
                    using (var writer = new StreamWriter(isolatedFileStream)) {
                        Save("UserLogin", writer);
                        Save("Password", writer);

                        writer.Flush();
                    }
                }
            }
            base.OnExit(e);
        }

        private static void Save(string key, StreamWriter writer) {
            if (!Current.Properties.Contains(key)) return;
            writer.WriteLine(Current.Properties[key]);
        }
    }
}