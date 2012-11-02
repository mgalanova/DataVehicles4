using DataVehicles4.DataAccess.Users;
using Ninject;

namespace DataVehicles4.ApplicationUseCase {
    internal static class Repositories {
        private static readonly StandardKernel kernel;

        static Repositories() {
            kernel = new StandardKernel();
            kernel.Bind<AdminDataContext>().To<AdminDataContext>();
        }

        public static TRepository New<TRepository>() {
            return kernel.Get<TRepository>();
        }
    }
}