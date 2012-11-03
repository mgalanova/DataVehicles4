namespace DataVehicle4.ViewModel {
    public interface IApplicationContext {
        void ShowMainWindow();
        void SaveProperty(string key, object value);
        object GetProperty(string key);
    }
}