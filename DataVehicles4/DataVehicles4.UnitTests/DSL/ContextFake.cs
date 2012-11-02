#region Usings

using DataVehicle4.ViewModel;
using Ninject;

#endregion

namespace DataVehicles4.UnitTests.DSL {
    public class ContextFake : IContext {
        private readonly StandardKernel kernel;

        public ContextFake() {
            View = new ViewContextFake();
            kernel = new StandardKernel(new TestDependencyContainer());
        }

        IViewContext IContext.View {
            get { return View; }
        }

        public TService Service<TService>() {
            return kernel.Get<TService>();
        }

        public ViewContextFake View { get; private set; }
    }
}