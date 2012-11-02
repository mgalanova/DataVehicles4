#region Usings

using DataVehicles4.ServiceProxy.AdminServiceReference;
using DataVehicles4.ServiceProxy.DvServiceReference;
using Ninject.Modules;

#endregion

namespace DataVehicle4.ViewModel.Injection {
    public class ViewModelDependencyContainer : NinjectModule {
        public override void Load() {
            Kernel.Bind<IAdminService>().To<AdminServiceClient>();
            Kernel.Bind<IDvService>().To<DvServiceClient>();
        }
    }
}