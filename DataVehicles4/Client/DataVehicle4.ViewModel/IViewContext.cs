namespace DataVehicle4.ViewModel {
    public interface IApplicationContext {
        void ShowMainWindow();
        void SaveProperty(string key, string value);
        string GetProperty(string key);
    }
}