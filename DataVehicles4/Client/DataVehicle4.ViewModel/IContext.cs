namespace DataVehicle4.ViewModel {
    public interface IContext {
        IApplicationContext Application { get; }
        TService Service<TService>();
    }
}