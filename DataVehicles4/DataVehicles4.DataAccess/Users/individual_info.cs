//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataVehicles4.DataAccess.Users
{
    using System;
    using System.Collections.Generic;
    
    public partial class individual_info
    {
        public string value { get; set; }
        public int user_id { get; set; }
    
        public virtual user user { get; set; }
    }
}
