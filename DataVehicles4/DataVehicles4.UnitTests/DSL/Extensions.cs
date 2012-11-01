using System.Windows.Input;

namespace DataVehicles4.UnitTests.DSL {
    public static class Extensions {
         public static void Execute(this ICommand command) {
             command.Execute(null);
         }
    }
}