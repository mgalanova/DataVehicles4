﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<cache> caches { get; set; }
        public DbSet<data_bases> data_bases { get; set; }
        public DbSet<database_type> database_type { get; set; }
        public DbSet<individual_info> individual_info { get; set; }
        public DbSet<restrict> restricts { get; set; }
        public DbSet<user> users { get; set; }
        public DbSet<user_has_restrict> user_has_restrict { get; set; }
        public DbSet<user_has_restrict_fields> user_has_restrict_fields { get; set; }
        public DbSet<user_pivot> user_pivot { get; set; }
    }
}
