namespace DataVehicle4.ViewModel {
    public interface IContext {
        IViewContext View { get; }
        TService Service<TService>();
    }
}