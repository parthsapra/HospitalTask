using Hospital.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static Hospital.Models.ApplicationObjects;

namespace Hospital.Context
{
    public class HospitalContext:DbContext
    {
        public HospitalContext(DbContextOptions<HospitalContext> options): base(options) { }
        public DbSet<Departments> Departments { get; set; }
        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{
        //    modelBuilder
        //        .Entity<Doctors>()
        //        .Property(p => p.Gender)
        //        .HasConversion(
        //            v => v.ToString(),
        //            v => (Gender)Enum.Parse(typeof(Gender), v));
        //}
        public DbSet<Doctors> Doctors { get; set; }
        public DbSet<HealthcareAssistents> HealthcareAssistents { get; set; }
        public DbSet<Medicines> Medicines { get; set; }
        public DbSet<Patients> Patients { get; set; }
        public DbSet<Priscriptions> Priscriptions { get; set; }
        public DbSet<Beds> Beds { get; set; }
       
    }
}
