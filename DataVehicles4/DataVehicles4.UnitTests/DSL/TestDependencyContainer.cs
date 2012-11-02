using DataVehicles4.ServiceProxy.AdminServiceReference;
using DataVehicles4.ServiceProxy.DvServiceReference;
using Ninject.Modules;
using Rhino.Mocks;

namespace DataVehicles4.UnitTests.DSL {
    public class TestDependencyContainer : NinjectModule {
        public override void Load() {
            Kernel.Bind<IAdminService>().To<ServiceFake>();
            Kernel.Bind<IDvService>().To<ServiceFake>();
        }
    }

    public class ServiceFake : IAdminService, IDvService {
        public bool Authorize(string userLogin, string password) {
            return true;
        }

        public string GetData(int value) {
            return "";
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite) {
            throw new System.NotImplementedException();
        }
    }
}