using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Hospital.Models
{
    public class Priscriptions
    {
        [Key]
        public int PriscriptionId { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public int MedicineId { get; set; }
        public int Quantity { get; set; }
        public int TimeToTackDrug { get; set; }
    }
}
