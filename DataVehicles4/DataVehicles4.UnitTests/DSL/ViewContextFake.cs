#region Usings

using System;
using DataVehicle4.ViewModel;

#endregion

namespace DataVehicles4.UnitTests.DSL {
    public class ViewContextFake : IViewContext {
        public ViewContextFake() {
            IsWelcomeVisible = true;
        }

        public void CloseWelcome() {
            IsWelcomeVisible = false;
        }

        public bool IsWelcomeVisible { get; private set; }
    }
}