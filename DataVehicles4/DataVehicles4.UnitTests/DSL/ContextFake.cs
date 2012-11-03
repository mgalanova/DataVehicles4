#region Usings

using DataVehicle4.ViewModel;
using Ninject;

#endregion

namespace DataVehicles4.UnitTests.DSL {
    public class ContextFake : IContext {
        private readonly StandardKernel kernel;

        public ContextFake() {
            Application = new ApplicationContextFake();
            kernel = new StandardKernel(new TestDependencyContainer());
        }

        IApplicationContext IContext.Application {
            get { return Application; }
        }

        public TService Service<TService>() {
            return kernel.Get<TService>();
        }

        public ApplicationContextFake Application { get; private set; }
    }
}