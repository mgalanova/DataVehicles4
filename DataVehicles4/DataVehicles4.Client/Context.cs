#region Usings

using DataVehicle4.ViewModel;
using DataVehicle4.ViewModel.Injection;
using Ninject;

#endregion

namespace DataVehicles4.Client {
    public class Context : IContext {
        private readonly StandardKernel kernel;

        public Context() {
            Application = new ApplicationContext();
            kernel = new StandardKernel(new ViewModelDependencyContainer());
        }

        public IApplicationContext Application { get; private set; }

        public TService Service<TService>() {
            return kernel.Get<TService>();
        }
    }
}