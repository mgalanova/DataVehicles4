#region Usings

using DataVehicle4.ViewModel;
using DataVehicle4.ViewModel.Injection;
using Ninject;

#endregion

namespace DataVehicles4.Client {
    public class Context : IContext {
        private readonly StandardKernel kernel;

        public Context() {
            View = new ViewContext();
            kernel = new StandardKernel(new ViewModelDependencyContainer());
        }

        public IViewContext View { get; private set; }

        public TService Service<TService>() {
            return kernel.Get<TService>();
        }
    }
}